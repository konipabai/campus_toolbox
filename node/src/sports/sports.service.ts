import { Injectable } from '@nestjs/common';
import { FE_getSportsDto, FE_postSportsDto, BE_filterSportsDto, DB_resultSportsDto, BE_mergedSportsDto } from './dto/sports.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { resultSport } from './entities/sports.entity';
import { Repository } from 'typeorm';
import { sports } from './constants'
import * as moment from 'moment-timezone';

@Injectable()
export class SportsService {
  constructor(
    @InjectRepository(resultSport) private readonly sportsResult: Repository<resultSport>
  ) { }

  async getSports(params: FE_getSportsDto): Promise<BE_filterSportsDto[]> {
    var findSportsData: BE_filterSportsDto[] = []
    try {
      findSportsData = sports.filter(item => item.sportsType == params.type)
      var tempSports: DB_resultSportsDto[] = await this.sportsResult.find({
        where: {
          date: params.date,
          type: params.type
        }
      })
      for (let i = 0; i < tempSports.length; i++) {
        if (tempSports[i].ownership == 'true') {
          for (let j = i + 1; j < tempSports.length; j++) {
            if (tempSports[i].date == tempSports[j].date &&
              tempSports[i].startTime.toISOString() == tempSports[j].startTime.toISOString() &&
              tempSports[i].endTime.toISOString() == tempSports[j].endTime.toISOString() &&
              tempSports[i].type == tempSports[j].type &&
              tempSports[i].court == tempSports[j].court &&
              tempSports[i].location == tempSports[j].location &&
              tempSports[i].collaborative == tempSports[j].collaborative) {
                tempSports[i].number += tempSports[j].number
            }
          }
        }
      }
      tempSports = tempSports.filter((reserveItem) => {
        return new Date(params.time[0]) < reserveItem.endTime && reserveItem.startTime < new Date(params.time[1]) && reserveItem.ownership == 'true'
      })
      findSportsData.map((sportsItem) => {
        sportsItem.date = params.date
        sportsItem.reserveTime = params.time
        const mergedArray: BE_mergedSportsDto[] = []
        tempSports.map((reserveItem) => {
          if (sportsItem.sportsType == reserveItem.type && sportsItem.sportsCourt == reserveItem.court) {
            mergedArray.push({ time: [reserveItem.startTime, reserveItem.endTime], location: reserveItem.location, number: reserveItem.number, collaborative: reserveItem.collaborative, id: reserveItem.id })
          }
        })
        mergedArray.sort((a, b) => {
          if (a.collaborative !== b.collaborative) {
            return ['是', '否'].indexOf(a.collaborative) - ['是', '否'].indexOf(b.collaborative);
          } else if (a.time[0].getTime() !== b.time[0].getTime()) {
            return a.time[0].getTime() - b.time[0].getTime()
          } else if (a.time[1].getTime() !== b.time[1].getTime()) {
            return a.time[1].getTime() - b.time[1].getTime()
          } else if (a.location !== b.location) {
            return ['全场', 'a半', 'b半'].indexOf(a.location) - ['全场', 'a半', 'b半'].indexOf(b.location);
          } else {
            return a.number - b.number
          }
        });
        sportsItem.time = mergedArray.map(item => item.time);
        sportsItem.location = mergedArray.map(item => item.location);
        sportsItem.number = mergedArray.map(item => item.number)
        sportsItem.collaborative = mergedArray.map(item => item.collaborative)
        sportsItem.id = mergedArray.map(item => item.id)
      })
    } catch (error) {
      console.log(error);
    }
    return findSportsData;
  }

  async postSports(params: FE_postSportsDto) {
    var hasNoOverlap: boolean = true
    var tempSports: DB_resultSportsDto[] = []
    try {
      if (params.ownership == 'true') {
        tempSports = await this.sportsResult.find({
          where: {
            date: params.date,
            type: params.typeAndCourt.slice(0, params.typeAndCourt.length - 1),
            court: params.typeAndCourt.slice(-1),
            ownership: 'true'
          }
        })
        tempSports = tempSports.filter((reserveItem) => {
          return new Date(params.time[0]) < reserveItem.endTime && reserveItem.startTime < new Date(params.time[1])
            && (reserveItem.location == params.location || reserveItem.location == '全场' || params.location == '全场')
        })
      } else {
        params.time[0] = moment(`${params.date}T${params.time[0]}`).toISOString()
        params.time[1] = moment(`${params.date}T${params.time[1]}`).toISOString()
      }
      if (tempSports.length == 0) {
        await this.sportsResult.save({
          account: params.account,
          date: params.date,
          startTime: new Date(params.time[0]),
          endTime: new Date(params.time[1]),
          type: params.typeAndCourt.slice(0, params.typeAndCourt.length - 1),
          court: params.typeAndCourt.slice(-1),
          location: params.location,
          collaborative: params.collaborative,
          number: params.number,
          ownership: params.ownership,
          valid: 'true'
        })
        hasNoOverlap = true
      } else {
        hasNoOverlap = false
      }
    } catch (error) {
      hasNoOverlap = false
      console.log(error);
    }
    return hasNoOverlap;
  }
}
