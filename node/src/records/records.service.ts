import { Injectable } from '@nestjs/common';
import { DB_resultClassroomDto, DB_resultSeatDto, DB_resultSportsDto, FE_getRecordsDto, FE_resultClassroomDto, FE_resultSeatDto, FE_resultSportsDto, FE_deleteRecordsDto } from './dto/record.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { resultClassroom } from 'src/classroom/entities/classroom.entity';
import { resultSeat } from 'src/seat/entities/seat.entity';
import { resultSport } from 'src/sports/entities/sports.entity';
import * as moment from 'moment-timezone';

@Injectable()
export class RecordsService {
  constructor(
    @InjectRepository(resultClassroom) private readonly classroomResult: Repository<resultClassroom>,
    @InjectRepository(resultSeat) private readonly seatResult: Repository<resultSeat>,
    @InjectRepository(resultSport) private readonly sportResult: Repository<resultSport>,
  ) { }

  async getRecords(params: FE_getRecordsDto) {
    var findRecordsData: DB_resultClassroomDto[] | DB_resultSeatDto[] | DB_resultSportsDto[] = []
    try {
      var tempRecruitment: DB_resultClassroomDto[] | DB_resultSeatDto[] | DB_resultSportsDto[] = []
      if (params.reservedType == '预约教室记录') {
        tempRecruitment = await this.classroomResult.find({
          where: {
            account: params.account
          },
          order: {
            id: "DESC"
          }
        })
      } else if (params.reservedType == '预约图书馆座位记录') {
        tempRecruitment = await this.seatResult.find({
          where: {
            account: params.account
          },
          order: {
            id: "DESC"
          }
        })
      } else {
        tempRecruitment = await this.sportResult.find({
          where: {
            account: params.account
          },
          order: {
            id: "DESC"
          }
        })
        for (let i = 0; i < tempRecruitment.length; i++) {
          tempRecruitment[i].startTime = moment(tempRecruitment[i].startTime).format('HH:mm')
          tempRecruitment[i].endTime = moment(tempRecruitment[i].endTime).format('HH:mm')
        }
      }
      findRecordsData = tempRecruitment
    } catch (error) {
      console.log(error);
    }
    return findRecordsData;
  }

  // async updateRecords(params: FE_resultClassroomDto | FE_resultSeatDto | FE_resultSportsDto): Promise<boolean> {
  //   try {
  //     if (params.reservedType == '预约教室记录') {
  //       delete params.reservedType;
  //       await this.classroomResult.update(params.id, params as FE_resultClassroomDto)
  //     } else if (params.reservedType == '预约图书馆座位记录') {
  //       delete params.reservedType;
  //       await this.seatResult.update(params.id, params as FE_resultSeatDto)
  //     } else {
  //       delete params.reservedType;
  //       await this.sportResult.update(params.id, params as FE_resultSportsDto)
  //     }
  //     return true
  //   } catch (error) {
  //     console.log(error);
  //     return false
  //   }
  // }

  async deleteRecords(params: FE_deleteRecordsDto): Promise<boolean> {
    try {
      if (params.reservedType == '预约教室记录') {
        await this.classroomResult.delete(params.id)
      } else if (params.reservedType == '预约图书馆座位记录') {
        await this.seatResult.delete(params.id)
      } else {
        const tempRecruitment = await this.sportResult.findOne({
          where: {
            id: params.id
          }
        })
        if (tempRecruitment.ownership == 'true') {
          await this.sportResult.update({
            date: tempRecruitment.date,
            startTime: tempRecruitment.startTime,
            endTime: tempRecruitment.endTime,
            type: tempRecruitment.type,
            court: tempRecruitment.court,
            location: tempRecruitment.location,
            collaborative: tempRecruitment.collaborative
          }, { valid: 'false' })
        }
        await this.sportResult.delete(params.id)
      }
      return true
    } catch (error) {
      console.log(error);
      return false
    }
  }
}
