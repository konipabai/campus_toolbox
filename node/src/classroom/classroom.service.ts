import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateClassroomDto } from './dto/create-classroom.dto';
import { UpdateClassroomDto } from './dto/update-classroom.dto';
import { Classroom } from './entities/classroom.entity';
import { classroom } from './constants';
import type { classroomType } from "./constants-type"
import * as moment from 'moment-timezone';

@Injectable()
export class ClassroomService {
  constructor(
    @InjectRepository(Classroom) private readonly classroom: Repository<Classroom>,
  ) { }

  async findClassroom(query: { building: string, floor: string, date: string, time: string }): Promise<classroomType[]> {
    var classroomData: classroomType[] = []
    if ((query.building != null && query.floor != null) && (query.building != '' && query.floor != '')) {
      classroomData = classroom.filter((item) => {
        return (item.classroomBuilding == query.building && item.classroomFloor == query.floor)
      })
    } else if (query.building != null && query.building != '') {
      classroomData = classroom.filter((item) => {
        return item.classroomBuilding == query.building
      })
    } else if (query.floor != null && query.floor != '') {
      classroomData = classroom.filter((item) => {
        return item.classroomFloor == query.floor
      })
    } else {
      classroomData = classroom
    }

    var formattedDateTime: string = ''
    if (query.date != null && query.date != '') {
      formattedDateTime = moment(query.date).tz('Asia/Shanghai').format('YYYY MM DD');
    } else {
      formattedDateTime = moment().tz('Asia/Shanghai').format('YYYY MM DD');
    }

    const reserveClassroom: CreateClassroomDto[] = await this.classroom.find()
    classroomData.map((classroomItem: classroomType) => {
      classroomItem.time = []
      classroomItem.date = formattedDateTime
      var timeData: string[] = []
      if (query.time != null && query.time != '') {
        timeData.push(query.time)
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
      reserveClassroom.map((reserveItem: CreateClassroomDto) => {
        if ((reserveItem.classroomNumber == classroomItem.classroomNumber) && (classroomItem.date == reserveItem.date) && (reserveItem.state == "true")) {
          timeData = timeData.filter(item => item != reserveItem.time)
        }
      })
      classroomItem.time = timeData
    })

    return classroomData
  }

  create(createClassroomDto: CreateClassroomDto) {
    return 'This action adds a new classroom';
  }

  findOne(id: number) {
    return `This action returns a #${id} classroom`;
  }

  update(id: number, updateClassroomDto: UpdateClassroomDto) {
    return `This action updates a #${id} classroom`;
  }

  remove(id: number) {
    return `This action removes a #${id} classroom`;
  }
}
