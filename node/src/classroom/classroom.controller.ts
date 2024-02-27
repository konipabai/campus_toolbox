import { Controller, Get, Post, Body, Query, Headers } from '@nestjs/common';
import { ClassroomService } from './classroom.service';
import type { FE_getClassroomDto, FE_postClassroomDto } from './dto/classroom.dto';
import * as jwt from 'jsonwebtoken';

@Controller('classroom')
export class ClassroomController {
  constructor(private readonly classroomService: ClassroomService) { }

  @Get()
  getClassroom(@Query() params: FE_getClassroomDto) {
    return this.classroomService.getClassroom(params);
  }

  @Post()
  postClassroom(@Headers() headers: any, @Body() params: FE_postClassroomDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.accountAndName = (tokenData as jwt.JwtPayload).name + ' ' + (tokenData as jwt.JwtPayload).account
    return this.classroomService.postClassroom(params);
  }
}
