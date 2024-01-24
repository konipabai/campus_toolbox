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
        id: lostFoundItem.id,
        name: "(" + lostFoundItem.state + ")\n" + lostFoundItem.item,
        item: lostFoundItem.item,
        state: lostFoundItem.state,
        value: 1,
        brand: lostFoundItem.brand,
        location: lostFoundItem.location,
        date: lostFoundItem.date,
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
    params.date = moment(params.date).tz('Asia/Shanghai').format('YYYY-MM-DD');
    params.overdue = 'false';
    delete params.id;
    try {
      await this.lostFoundResult.save(params)
      return true
    } catch (error) {
      console.log(error);
      return false
    }
  }

  async updateLostFound(id: number, params: FE_postLostFoundDto): Promise<boolean> {
    params.date = moment(params.date).tz('Asia/Shanghai').format('YYYY-MM-DD');
    if (params.brand == '') {
      params.brand = '无/暂不清楚'
    }
    if (params.description == '') {
      params.description = '无'
    }
    delete params.id;
    try {
      await this.lostFoundResult.update(id, params)
      return true
    } catch (error) {
      console.log(error);
      return false
    }
  }

  async deleteLostFound(id: number): Promise<boolean> {
    try {
      await this.lostFoundResult.delete(id)
      return true
    } catch (error) {
      console.log(error);
      return false
    }
  }
}
