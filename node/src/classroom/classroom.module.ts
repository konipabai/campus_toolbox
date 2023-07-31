import { Module } from '@nestjs/common';
import { ClassroomService } from './classroom.service';
import { ClassroomController } from './classroom.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { resultClassroom, checkClassroom } from './entities/classroom.entity';

@Module({
  imports: [TypeOrmModule.forFeature([resultClassroom, checkClassroom])],
  controllers: [ClassroomController],
  providers: [ClassroomService]
})
export class ClassroomModule { }
