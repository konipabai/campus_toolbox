import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as moment from 'moment-timezone';
import { Repository } from 'typeorm';
import { DB_resultFaultDto, FE_postFaultDto, FE_getFaultDto, FE_deleteFaultDto } from './dto/fault.dto';
import { resultFault } from './entities/fault.entity';

@Injectable()
export class FaultService {
  constructor(
    @InjectRepository(resultFault) private readonly faultResult: Repository<resultFault>
  ) { }

  async getFault(params: FE_getFaultDto): Promise<DB_resultFaultDto[]> {
    var faultData: DB_resultFaultDto[] = []
    try {
      faultData = await this.faultResult.find({
        where: {
          account: params.account
        },
        order: {
          id: "DESC"
        }
      })
    } catch (error) {
      console.log(error);
    }
    return faultData
  }

  async postFault(params: FE_postFaultDto): Promise<boolean> {
    if (params.description == '') {
      params.description = '无'
    }
    params.date = moment(new Date()).tz('Asia/Shanghai').format('YYYY-MM-DD');
    params.state = 'false'
    try {
      await this.faultResult.save(params)
      return true
    } catch (error) {
      console.log(error);
      return false
    }
  }

  async updateFault(params: FE_postFaultDto): Promise<boolean> {
    try {
      var faultData: DB_resultFaultDto = await this.faultResult.findOne({
        where: {
          id: params.id
        }
      })
      if (faultData.account == params.account) {
        if (params.description == '') {
          params.description = '无'
        }
        await this.faultResult.update(params.id, params)
        return true
      } else {
        return false
      }
    } catch (error) {
      console.log(error);
      return false
    }
  }

  async deleteFault(params: FE_deleteFaultDto): Promise<boolean> {
    try {
      var faultData: DB_resultFaultDto = await this.faultResult.findOne({
        where: {
          id: params.id
        }
      })
      if (faultData.account == params.account) {
        await this.faultResult.delete(params.id)
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
