import { Module } from '@nestjs/common';
import { SeatService } from './seat.service';
import { SeatController } from './seat.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { resultSeat } from './entities/seat.entity';

@Module({
  imports: [TypeOrmModule.forFeature([resultSeat])],
  controllers: [SeatController],
  providers: [SeatService]
})
export class SeatModule {}
