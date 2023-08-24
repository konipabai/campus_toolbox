import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BE_filterSeatDto, FE_getSeatDto, DB_resultSeatDto, BE_mergedSeatDto } from './dto/seat.dto';
import { resultSeat } from './entities/seat.entity'
import { seat } from './constants'

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
        var timeData: string[] = []
        var seatData: string[] = []
        tempSeat.map((reserveItem: DB_resultSeatDto) => {
          if (seatItem.number == reserveItem.number) {
            timeData.push(reserveItem.time)
            seatData.push(reserveItem.seat)
          }
        })
        const mergedArray: BE_mergedSeatDto[] = timeData.map((time, index) => ({
          time,
          seat: seatData[index]
        }));
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

  create(FE_getSeatDto: FE_getSeatDto) {
    return `This action returns all seat`;
  }
}
