import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { ClassroomService } from './classroom.service';
import type { FE_getClassroomDto, FE_reserveClassroomDto } from './dto/classroom.dto';

@Controller('classroom')
export class ClassroomController {
  constructor(private readonly classroomService: ClassroomService) { }

  @Get()
  getClassroom(@Query() params: FE_getClassroomDto) {
    return this.classroomService.getClassroom(params);
  }

  @Post()
  reserveClassroom(@Body() params: FE_reserveClassroomDto) {
    return this.classroomService.reserveClassroom(params);
  }
}
