import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as moment from 'moment-timezone';
import { Repository } from 'typeorm';
import { BE_filterLostFoundDto, DB_resultLostFoundDto, FE_postLostFoundDto, FE_getLostFoundDto, FE_deleteLostFoundDto } from './dto/lostFound.dto';
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
            switch: 'on',
            overdue: 'false'
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

  async updateLostFound(params: FE_postLostFoundDto): Promise<boolean> {
    try {
      var tempLostFound: DB_resultLostFoundDto = await this.lostFoundResult.findOne({
        where: {
          id: params.id
        }
      })
      if (tempLostFound.account == params.account) {
        params.date = moment(params.date).tz('Asia/Shanghai').format('YYYY-MM-DD');
        if (params.brand == '') {
          params.brand = '无/暂不清楚'
        }
        if (params.description == '') {
          params.description = '无'
        }
        await this.lostFoundResult.update(params.id, params)
        return true
      } else {
        return false
      }
    } catch (error) {
      console.log(error);
      return false
    }
  }

  async deleteLostFound(params: FE_deleteLostFoundDto): Promise<boolean> {
    try {
      var tempLostFound: DB_resultLostFoundDto = await this.lostFoundResult.findOne({
        where: {
          id: params.id
        }
      })
      if (tempLostFound.account == params.account) {
        await this.lostFoundResult.delete(params.id)
        return true
      } else {
        return false
      }
    } catch (error) {
      console.log(error);
      return false
    }
  }
}
