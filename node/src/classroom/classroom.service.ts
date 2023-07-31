import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { resultClassroom, checkClassroom } from './entities/classroom.entity';
import { classroom } from './constants';
import type { DB_resultClassroomDto, DB_pendingClassroomDto, BE_filterClassroomDto, FE_findClassroomDto, FE_reserveClassroomDto } from './dto/classroom.dto';
import * as moment from 'moment-timezone';

@Injectable()
export class ClassroomService {
  constructor(
    @InjectRepository(resultClassroom) private readonly classroomResult: Repository<resultClassroom>,
    @InjectRepository(checkClassroom) private readonly classroomCheck: Repository<checkClassroom>,
  ) { }

  async findClassroom(params: FE_findClassroomDto): Promise<BE_filterClassroomDto[]> {
    var findClassroomData: BE_filterClassroomDto[] = []

    try {
      const tempClassroom: DB_resultClassroomDto[] = await this.classroomResult.find()
      if ((params.building != null && params.floor != null) && (params.building != '' && params.floor != '')) {
        findClassroomData = classroom.filter((item) => {
          return (item.classroomBuilding == params.building && item.classroomFloor == params.floor)
        })
      } else if (params.building != null && params.building != '') {
        findClassroomData = classroom.filter((item) => {
          return item.classroomBuilding == params.building
        })
      } else if (params.floor != null && params.floor != '') {
        findClassroomData = classroom.filter((item) => {
          return item.classroomFloor == params.floor
        })
      } else {
        findClassroomData = classroom
      }

      var formattedDateTime: string = ''
      if (params.date != null && params.date != '') {
        formattedDateTime = moment(params.date).tz('Asia/Shanghai').format('YYYY/MM/DD');
      } else {
        formattedDateTime = moment().tz('Asia/Shanghai').format('YYYY/MM/DD');
      }
      findClassroomData.map((classroomItem: BE_filterClassroomDto) => {
        classroomItem.time = []
        classroomItem.date = formattedDateTime
        var timeData: string[] = []
        if (params.time != null && params.time != '') {
          timeData.push(params.time)
        } else {
          timeData = [
            '第1节 8:30-9:15',
            '第2节 9:20-10:05',
            '第3节 10:25-11:10',
            '第4节 11:15-12:00',
            '第5节 14:00-14:45',
            '第6节 14:50-15:35',
            '第7节 15:55-16:40',
            '第8节 16:45-17:30',
            '第9节 18:30-19:15',
            '第10节 19:20-20:05',
            '第11节 20:25-21:10',
            '第12节 21:15-22:00'
          ]
        }
        tempClassroom.map((reserveItem: DB_resultClassroomDto) => {
          if ((reserveItem.classroomNumber == classroomItem.classroomNumber) && (classroomItem.date == reserveItem.date) && (reserveItem.state == "true")) {
            timeData = timeData.filter(item => item != reserveItem.time)
          }
        })
        classroomItem.time = timeData
      })
    } catch (error) {
      console.log(error);
    }
    return findClassroomData
  }

  async reserveClassroom(params: FE_reserveClassroomDto): Promise<boolean> {
    var reserveClassroomData: DB_pendingClassroomDto = {
      account: '',
      name: '',
      classroomNumber: '',
      reason: '',
      date: '',
      time: ''
    }
    if ((params.accountAndName != null && params.accountAndName != '') &&
      (params.classroomNumber != null && params.classroomNumber != '') &&
      (params.dateAndTime != null && params.dateAndTime != '') &&
      (params.reason != null && params.reason != '')) {
      reserveClassroomData.account = params.accountAndName.split(" ")[1]
      reserveClassroomData.name = params.accountAndName.split(" ")[0]
      reserveClassroomData.classroomNumber = params.classroomNumber
      reserveClassroomData.reason = params.reason
      reserveClassroomData.date = params.dateAndTime.split(" ")[0]
      reserveClassroomData.time = params.dateAndTime.split(" ")[1]
      try {
        await this.classroomCheck.save(reserveClassroomData)
        return true
      } catch (error) {
        console.log(error);
        return false
      }
    } else {
      return false
    }

  }

  findOne(id: number) {
    return `This action returns a #${id} classroom`;
  }

  update(id: number, FE_reserveClassroomDto: FE_reserveClassroomDto) {
    return `This action updates a #${id} classroom`;
  }

  remove(id: number) {
    return `This action removes a #${id} classroom`;
  }
}
