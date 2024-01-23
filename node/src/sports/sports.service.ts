import { Injectable } from '@nestjs/common';
import { FE_getSportsDto, FE_postSportsDto, BE_filterSportsDto, DB_resultSportsDto, BE_mergedSportsDto } from './dto/sports.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { resultSport } from './entities/sports.entity';
import { Repository } from 'typeorm';
import { sports } from './constants'

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

      tempSports = tempSports.filter((reserveItem) => {
        return new Date(params.time[0]) < reserveItem.endTime && reserveItem.startTime < new Date(params.time[1])
      })
      findSportsData.map((sportsItem) => {
        sportsItem.date = params.date
        const mergedArray: BE_mergedSportsDto[] = []
        tempSports.map((reserveItem) => {
          if (sportsItem.sportsType == reserveItem.type && sportsItem.sportsCourt == reserveItem.court) {
            mergedArray.push({ time: [reserveItem.startTime, reserveItem.endTime], location: reserveItem.location })
          }
        })
        mergedArray.sort((a, b) => {
          if (a.time[0].getTime() !== b.time[0].getTime()) {
            return a.time[0].getTime() - b.time[0].getTime()
          } else if (a.time[1].getTime() !== b.time[1].getTime()) {
            return a.time[1].getTime() - b.time[1].getTime()
          } else {
            return ['全场', 'a半', 'b半'].indexOf(a.location) - ['全场', 'a半', 'b半'].indexOf(b.location);
          }
        });
        sportsItem.time = mergedArray.map(item => item.time);
        sportsItem.location = mergedArray.map(item => item.location);
      })
    } catch (error) {
      console.log(error);
    }
    return findSportsData;
  }

  async postSports(params: FE_postSportsDto) {
    return `This action returns all sports`;
  }
}
