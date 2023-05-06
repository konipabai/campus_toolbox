import { Module } from '@nestjs/common';
import { ClassroomService } from './classroom.service';
import { ClassroomController } from './classroom.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Classroom } from './entities/classroom.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Classroom])],
  controllers: [ClassroomController],
  providers: [ClassroomService]
})
export class ClassroomModule {}
