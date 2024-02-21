import { Controller, Get, Post, Body, Query } from '@nestjs/common';
import { ClassroomService } from './classroom.service';
import type { FE_getClassroomDto, FE_postClassroomDto } from './dto/classroom.dto';

@Controller('classroom')
export class ClassroomController {
  constructor(private readonly classroomService: ClassroomService) { }

  @Get()
  getClassroom(@Query() params: FE_getClassroomDto) {
    return this.classroomService.getClassroom(params);
  }

  @Post()
  postClassroom(@Body() params: FE_postClassroomDto) {
    return this.classroomService.postClassroom(params);
  }
}
