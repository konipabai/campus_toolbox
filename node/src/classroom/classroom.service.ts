import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateClassroomDto } from './dto/create-classroom.dto';
import { UpdateClassroomDto } from './dto/update-classroom.dto';
import { Classroom } from './entities/classroom.entity';
import { classroom } from './constants';
import { classroomType } from "./constants-type"

@Injectable()
export class ClassroomService {
  constructor(
    @InjectRepository(Classroom) private readonly classroom: Repository<Classroom>,
  ) { }

  async findClassroom(query: { building: string, floor: string, date: string, time: string }): Promise<classroomType[]> {
    let classroomData: classroomType[] = []
    if (query.building != null && query.floor != null) {
      classroomData = classroom.filter((item) => {
        return (item.classroomBuilding == query.building && item.classroomFloor == query.floor)
      })
    } else if (query.building != null) {
      classroomData = classroom.filter((item) => {
        return item.classroomBuilding == query.building
      })
    } else if (query.floor != null) {
      classroomData = classroom.filter((item) => {
        return item.classroomFloor == query.floor
      })
    } else {
      classroomData = classroom
    }

    var dateYear = ""
    var dateMonth = ""
    var dateDay = ""
    if (query.date == null) {
      const nowDate = new Date();
      dateYear = nowDate.getFullYear().toString();
      dateMonth = (nowDate.getMonth() + 1).toString();
      dateDay = nowDate.getDate().toString();
    } else {
      dateYear = query.date.split(" ")[3]
      dateDay = query.date.split(" ")[2]
      if (query.date.split(" ")[1] == "Jan") dateMonth = "1"
      else if (query.date.split(" ")[1] == "Feb") dateMonth = "2"
      else if (query.date.split(" ")[1] == "Mar") dateMonth = "3"
      else if (query.date.split(" ")[1] == "Apr") dateMonth = "4"
      else if (query.date.split(" ")[1] == "May") dateMonth = "5"
      else if (query.date.split(" ")[1] == "Jun") dateMonth = "6"
      else if (query.date.split(" ")[1] == "Jul") dateMonth = "7"
      else if (query.date.split(" ")[1] == "Aug") dateMonth = "8"
      else if (query.date.split(" ")[1] == "Sep") dateMonth = "9"
      else if (query.date.split(" ")[1] == "Oct") dateMonth = "10"
      else if (query.date.split(" ")[1] == "Nov") dateMonth = "11"
      else if (query.date.split(" ")[1] == "Dec") dateMonth = "12"
    }

    const reserveClassroom: CreateClassroomDto[] = await this.classroom.find()
    classroomData.map((classroomItem: classroomType) => {
      classroomItem.time = []
      classroomItem.date = dateYear + " " + dateMonth + " " + dateDay
      var timeData = []
      if (query.time != null) {
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
