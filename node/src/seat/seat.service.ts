import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BE_filterSeatDto, FE_getSeatDto, DB_resultSeatDto, BE_mergedSeatDto, FE_postSeatDto } from './dto/seat.dto';
import { resultSeat } from './entities/seat.entity'
import { seat } from './constants'
import * as moment from 'moment-timezone';

@Injectable()
export class SeatService {
  constructor(
    @InjectRepository(resultSeat) private readonly seatResult: Repository<resultSeat>
  ) { }

  async getSeat(params: FE_getSeatDto): Promise<BE_filterSeatDto[]> {
    var findSeatData: BE_filterSeatDto[] = []
    try {
      findSeatData = seat
      var tempSeat: DB_resultSeatDto[] = await this.seatResult.find({
        where: {
          floor: params.floor,
          date: params.date
        }
      })
      findSeatData.map((seatItem: BE_filterSeatDto) => {
        const mergedArray: BE_mergedSeatDto[] = []
        tempSeat.map((reserveItem: DB_resultSeatDto) => {
          if (seatItem.number == reserveItem.number) {
            mergedArray.push({ time: reserveItem.time, seat: reserveItem.seat })
          }
        })

        mergedArray.sort((a, b) => {
          const aStartTime: number = parseInt(a.time.split('-')[0].replace(':', ''), 10);
          const bStartTime: number = parseInt(b.time.split('-')[0].replace(':', ''), 10);
          if (aStartTime !== bStartTime) {
            return aStartTime - bStartTime;
          }
          const aEndTime: number = parseInt(a.time.split('-')[1].replace(':', ''), 10);
          const bEndTime: number = parseInt(b.time.split('-')[1].replace(':', ''), 10);
          if (aEndTime !== bEndTime) {
            return aEndTime - bEndTime;
          }
          const aSeatNumber: number = parseInt(a.seat.replace('座', ''), 10);
          const bSeatNumber: number = parseInt(b.seat.replace('座', ''), 10);
          return aSeatNumber - bSeatNumber;
        });
        seatItem.time = mergedArray.map(item => item.time);
        seatItem.seat = mergedArray.map(item => item.seat);
      })
    } catch (error) {
      console.log(error);
    }
    return findSeatData;
  }

  async postSeat(params: FE_postSeatDto): Promise<boolean> {
    var hasNoOverlap: boolean = true
    try {
      var tempSeat: DB_resultSeatDto[] = await this.seatResult.find({
        where: {
          floor: params.floor,
          date: params.date,
          number: params.number.split('，')[2].split(' ')[0]
        }
      })
      function timeIsOverlap(timeRange: string, checkTimeRange: string) {
        var [timeStart, timeEnd] = timeRange.split('-');
        var [checkTimeStart, checkTimeEnd] = checkTimeRange.split('-');
        var timeStartMoment = moment(timeStart.trim(), 'HH:mm');
        var timeEndMoment = moment(timeEnd.trim(), 'HH:mm');
        var checkTimeStartMoment = moment(checkTimeStart.trim(), 'HH:mm');
        var checkTimeEndMoment = moment(checkTimeEnd.trim(), 'HH:mm');
        return (
          (timeStartMoment <= checkTimeStartMoment && checkTimeStartMoment < timeEndMoment) ||
          (timeStartMoment < checkTimeEndMoment && checkTimeEndMoment <= timeEndMoment) ||
          (timeStartMoment >= checkTimeStartMoment && checkTimeEndMoment > timeStartMoment) ||
          (timeEndMoment > checkTimeStartMoment && checkTimeEndMoment >= timeEndMoment)
        );
      }
      var tempTime: string = moment(params.time[0]).tz('Asia/Shanghai').format('HH:mm')
        + '-' + moment(params.time[1]).tz('Asia/Shanghai').format('HH:mm')
      if (tempTime.split('-')[0] != tempTime.split('-')[1]) {
        for (var i = 0; i < tempSeat.length; i++) {
          if (timeIsOverlap(tempSeat[i].time, tempTime) && (tempSeat[i].seat == params.seat)) {
            hasNoOverlap = false;
            break;
          }
        }
      } else {
        hasNoOverlap = false;
      }
      if (hasNoOverlap == true) {
        await this.seatResult.save({
          account: params.account,
          floor: params.floor,
          date: params.date,
          number: params.number.split('，')[2].split(' ')[0],
          time: tempTime,
          seat: params.seat
        })
      }
    } catch (error) {
      console.log(error);
    }
    return hasNoOverlap;
  }
}
