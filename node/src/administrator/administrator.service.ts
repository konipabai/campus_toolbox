import { Injectable } from '@nestjs/common';
import { DB_resultClassroomAdministratorDto, DB_resultFaultAdministratorDto, DB_resultLostFoundAdministratorDto, FE_deleteRecruitmentAdministratorDto, FE_getAdministratorDto, FE_postRecruitmentAdministratorDto, FE_updateClassroomAdministratorDto, FE_updateFaultAdministratorDto, FE_updateLFAdministratorDto } from './dto/administrator.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { resultClassroom } from 'src/classroom/entities/classroom.entity';
import { resultFault } from 'src/fault/entities/fault.entity';
import { resultLostFound } from 'src/lostFound/entities/lostFound.entity';
import { resultRecruitment } from 'src/recruitment/entities/recruitment.entity';
import { DB_resultRecruitmentDto } from 'src/recruitment/dto/recruitment.dto';

@Injectable()
export class AdministratorService {
  constructor(
    @InjectRepository(resultClassroom) private readonly classroomResult: Repository<resultClassroom>,
    @InjectRepository(resultFault) private readonly faultResult: Repository<resultFault>,
    @InjectRepository(resultLostFound) private readonly LostFoundResult: Repository<resultLostFound>,
    @InjectRepository(resultRecruitment) private readonly recruitmentResult: Repository<resultRecruitment>
  ) { }

  async getOrderAdministrator(params: FE_getAdministratorDto): Promise<DB_resultClassroomAdministratorDto[] | DB_resultFaultAdministratorDto[] | DB_resultLostFoundAdministratorDto[]> {
    var findReserveData: DB_resultClassroomAdministratorDto[] | DB_resultFaultAdministratorDto[] | DB_resultLostFoundAdministratorDto[] = []
    try {
      if (params.orderType == '预约') {
        var tempReserve: DB_resultClassroomAdministratorDto[] = []
        tempReserve = await this.classroomResult.createQueryBuilder('classroom')
          .innerJoin('resultUser', 'user', 'user.account = classroom.account')
          .select([
            'classroom.id AS id',
            'classroom.account AS account',
            'classroom.reason AS reason',
            'DATE_FORMAT(classroom.date, "%Y-%m-%d") AS date',
            'classroom.time AS time',
            'classroom.location AS location',
            'classroom.floor AS floor',
            'classroom.classroomNumber AS classroomNumber',
            'classroom.state AS state',
            'classroom.reasonRefusal AS reasonRefusal',
            'user.name AS name',
            'user.class AS class',
          ]).where({ state: 'false', reasonRefusal: '' }).getRawMany()
        findReserveData = tempReserve
      } else if (params.orderType == '报修') {
        var tempFault: DB_resultFaultAdministratorDto[] = []
        tempFault = await this.faultResult.createQueryBuilder('fault')
          .innerJoin('resultUser', 'user', 'user.account = fault.account')
          .select([
            'fault.id AS id',
            'fault.account AS account',
            'fault.item AS item',
            'fault.location AS location',
            'fault.number AS number',
            'fault.contact AS contact',
            'fault.description AS description',
            'DATE_FORMAT(fault.date, "%Y-%m-%d") AS date',
            'user.name AS name',
            'user.class AS class',
          ]).where({ state: 'false' }).getRawMany()
        findReserveData = tempFault
      } else if (params.orderType == '失物招领') {
        var tempLF: DB_resultLostFoundAdministratorDto[] = []
        tempLF = await this.LostFoundResult.createQueryBuilder('LostFound')
          .innerJoin('resultUser', 'user', 'user.account = LostFound.account')
          .select([
            'LostFound.id AS id',
            'LostFound.account AS account',
            'LostFound.state AS state',
            'LostFound.item AS item',
            'LostFound.brand AS brand',
            'LostFound.location AS location',
            'LostFound.description AS description',
            'LostFound.contact AS contact',
            'DATE_FORMAT(LostFound.date, "%Y-%m-%d") AS date',
            'LostFound.switch AS switch',
            'LostFound.overdue AS overdue',
            'user.name AS name',
            'user.class AS class',
          ]).where({ overdue: 'false' }).getRawMany()
        findReserveData = tempLF
      }
    } catch (error) {
      console.log(error);
    }
    return findReserveData;
  }

  async postOrderAdministrator(params: FE_postRecruitmentAdministratorDto): Promise<boolean> {
    try {
      if (params.description == '') {
        params.description = '无'
      }
      if (params.benefits == '') {
        params.benefits = '无'
      }
      var tempRequirements: string = ''
      params.requirements.map((item) => {
        tempRequirements += item + "||"
      })
      tempRequirements = tempRequirements.slice(0, tempRequirements.length - 2)
      var postRecruitmentData: DB_resultRecruitmentDto = {
        name: params.name,
        hr: params.hr,
        job: params.job,
        description: params.description,
        salary: params.salary,
        requirements: tempRequirements,
        benefits: params.benefits,
        contact: params.contact,
        location: params.location
      }
      await this.recruitmentResult.save(postRecruitmentData)
      return true
    } catch (error) {
      console.log(error);
      return false
    }
  }

  async updateOrderAdministrator(params: FE_updateClassroomAdministratorDto | FE_updateFaultAdministratorDto | FE_updateLFAdministratorDto): Promise<boolean> {
    try {
      if (params.orderType == '预约') {
        if ((params as FE_updateClassroomAdministratorDto).state == 'true') {
          await this.classroomResult.update(params.id, { state: (params as FE_updateClassroomAdministratorDto).state })
        } else {
          await this.classroomResult.update(params.id, { reasonRefusal: (params as FE_updateClassroomAdministratorDto).reasonRefusal })
        }
      } else if (params.orderType == '报修') {
        await this.faultResult.update(params.id, { state: (params as FE_updateFaultAdministratorDto).state })
      } else {
        await this.LostFoundResult.update(params.id, { overdue: (params as FE_updateLFAdministratorDto).overdue })
      }
      return true
    } catch (error) {
      console.log(error);
      return false
    }
  }

  async deleteOrderAdministrator(params: FE_deleteRecruitmentAdministratorDto): Promise<boolean> {
    try {
      if (params.orderType == '招聘') {
        await this.recruitmentResult.delete(params.id)
      } else {
        return false
      }
      return true
    } catch (error) {
      console.log(error);
      return false
    }
  }
}
