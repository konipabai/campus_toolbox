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

  async findClassroom(query: { building: string, floor: number }): Promise<classroom_type[]> {
    let classroom_data: classroom_type[] = []
    if (query.building != "" && query.floor != 0) {
      classroom_data = classroom.filter((item) => {
        return (item.classroom_building == query.building && item.classroom_floor == query.floor)
      })
    } else if (query.building != "") {
      classroom_data = classroom.filter((item) => {
        return item.classroom_building == query.building
      })
    } else if (query.floor != 0) {
      classroom_data = classroom.filter((item) => {
        return item.classroom_floor == query.floor
      })
    } else {
      classroom_data = classroom
    }
    const reserve_classroom: CreateClassroomDto[] = await this.classroom.find()
    classroom_data.map((classroom_item: classroom_type) => {
      classroom_item.reservation_orders = []
      reserve_classroom.map((reserve_item: CreateClassroomDto) => {
        if ((reserve_item.classroom_number == classroom_item.classroom_number) && (reserve_item.state == "true")) {
          classroom_item.reservation_orders.push([reserve_item.reason, reserve_item.time_frame])
        }
      })
    })
    return classroom_data
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
