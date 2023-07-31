import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { ClassroomService } from './classroom.service';
import type { FE_findClassroomDto, FE_reserveClassroomDto } from './dto/classroom.dto';

@Controller('classroom')
export class ClassroomController {
  constructor(private readonly classroomService: ClassroomService) { }

  @Get()
  findClassroom(@Query() params: FE_findClassroomDto) {
    return this.classroomService.findClassroom(params);
  }

  @Post()
  reserveClassroom(@Body() params: FE_reserveClassroomDto) {
    return this.classroomService.reserveClassroom(params);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.classroomService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() FE_reserveClassroomDto: FE_reserveClassroomDto) {
    return this.classroomService.update(+id, FE_reserveClassroomDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.classroomService.remove(+id);
  }
}
