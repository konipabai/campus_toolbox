import { Injectable } from '@nestjs/common';
import { DB_resultClassroomAdministratorDto, FE_getAdministratorDto, FE_updateAdministratorDto } from './dto/administrator.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { resultClassroom } from 'src/classroom/entities/classroom.entity';
import { resultUser } from 'src/user/entities/user.entity';
import { DB_resultUserDto } from 'src/user/dto/user.dto';

@Injectable()
export class AdministratorService {
  constructor(
    @InjectRepository(resultClassroom) private readonly classroomResult: Repository<resultClassroom>,
    @InjectRepository(resultUser) private readonly resultUser: Repository<resultUser>,
  ) { }

  async getReserveAdministrator(params: FE_getAdministratorDto): Promise<DB_resultClassroomAdministratorDto[]> {
    var findReserveData: DB_resultClassroomAdministratorDto[] = []
    try {
      var tempAdministrator: DB_resultUserDto
      tempAdministrator = await this.resultUser.findOne({
        where: {
          account: params.account
        }
      })
      if (tempAdministrator.administrator == 'true') {
        var tempReserve: DB_resultClassroomAdministratorDto[] = []
        tempReserve = await this.classroomResult.find({
          where: {
            state: 'false',
            reasonRefusal: ''
          }
        })
        tempReserve = tempReserve.map((item: DB_resultClassroomAdministratorDto) => {
          item.name = tempAdministrator.name
          item.class = tempAdministrator.class
          return item
        })
        findReserveData = tempReserve
      }
    } catch (error) {
      console.log(error);
    }
    return findReserveData;
  }

  async updateReserveAdministrator(params: FE_updateAdministratorDto): Promise<boolean> {
    try {
      var tempAdministrator: DB_resultUserDto
      tempAdministrator = await this.resultUser.findOne({
        where: {
          account: params.account
        }
      })
      if (tempAdministrator.administrator == 'true') {
        if (params.state == 'true') {
          await this.classroomResult.update(params.id, { state: params.state })
        } else {
          await this.classroomResult.update(params.id, { reasonRefusal: params.reasonRefusal })
        }
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
