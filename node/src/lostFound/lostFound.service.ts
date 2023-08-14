import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as moment from 'moment-timezone';
import { Repository } from 'typeorm';
import { BE_filterLostFoundDto, DB_resultLostFoundDto, FE_postLostFoundDto, FE_getLostFoundDto } from './dto/lostFound.dto';
import { resultLostFound } from './entities/lostFound.entity';

@Injectable()
export class LostFoundService {
  constructor(
    @InjectRepository(resultLostFound) private readonly lostFoundResult: Repository<resultLostFound>
  ) { }

  async getLostFound(params: FE_getLostFoundDto): Promise<BE_filterLostFoundDto[]> {
    var lostFoundData: BE_filterLostFoundDto[] = []
    try {
      var tempLostFound: DB_resultLostFoundDto[] = []
      if (params.account) {
        tempLostFound = await this.lostFoundResult.find({
          where: {
            account: params.account
          },
          order: {
            id: "DESC"
          }
        })
      } else {
        tempLostFound = await this.lostFoundResult.find({
          where: {
            switch: 'on'
          }
        })
      }
      lostFoundData = tempLostFound.map((lostFoundItem) => ({
        name: "(" + lostFoundItem.state + ")\n" + lostFoundItem.item,
        item: lostFoundItem.item,
        state: lostFoundItem.state,
        value: 1,
        brand: lostFoundItem.brand,
        location: lostFoundItem.location,
        time: lostFoundItem.time,
        description: lostFoundItem.description,
        contact: lostFoundItem.contact,
        switch: lostFoundItem.switch,
        overdue: lostFoundItem.overdue
      }))
    } catch (error) {
      console.log(error);
    }
    return lostFoundData
  }

  async postLostFound(params: FE_postLostFoundDto): Promise<boolean> {
    if (params.brand == '') {
      params.brand = '无/暂不清楚'
    }
    if (params.description == '') {
      params.description = '无'
    }
    params.time = moment(params.time).tz('Asia/Shanghai').format('YYYY/MM/DD');
    params.switch = 'on';
    params.overdue = 'false';
    try {
      await this.lostFoundResult.save(params)
      return true
    } catch (error) {
      console.log(error);
      return false
    }
  }

  create(BE_filterLostFoundDto: BE_filterLostFoundDto) {
    return 'This action adds a new lostFound';
  }

  findAll() {
    return `This action returns all lostFound`;
  }

  findOne(id: number) {
    return `This action returns a #${id} lostFound`;
  }

  update(id: number, BE_filterLostFoundDto: BE_filterLostFoundDto) {
    return `This action updates a #${id} lostFound`;
  }

  remove(id: number) {
    return `This action removes a #${id} lostFound`;
  }
}
