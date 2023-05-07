import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateClassroomDto } from './dto/create-classroom.dto';
import { UpdateClassroomDto } from './dto/update-classroom.dto';
import { Classroom } from './entities/classroom.entity';
import { classroom } from './constants';
import { classroom_type } from "./constants-type"

@Injectable()
export class ClassroomService {
  constructor(
    @InjectRepository(Classroom) private readonly classroom: Repository<Classroom>,
  ) { }

  findClassroom(query: { building: string, floor: number }): classroom_type[] {
    let data = []
    if (query.building != null && query.floor != null) {
      data = classroom.filter((item) => {
        return (item.classroom_building == query.building && item.classroom_floor == query.floor)
      })
    } else if (query.building != null) {
      data = classroom.filter((item) => {
        return item.classroom_building == query.building
      })
    } else if (query.floor != null) {
      data = classroom.filter((item) => {
        return item.classroom_floor == query.floor
      })
    } else {
      data = classroom
    }
    return data
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
