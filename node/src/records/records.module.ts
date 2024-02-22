import { Module } from '@nestjs/common';
import { RecordsService } from './records.service';
import { RecordsController } from './records.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { resultClassroom } from 'src/classroom/entities/classroom.entity';
import { resultSeat } from 'src/seat/entities/seat.entity';
import { resultSport } from 'src/sports/entities/sports.entity';

@Module({
  imports: [TypeOrmModule.forFeature([resultClassroom, resultSeat, resultSport])],
  controllers: [RecordsController],
  providers: [RecordsService]
})
export class RecordsModule {}
