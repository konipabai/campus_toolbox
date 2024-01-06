import { Module } from '@nestjs/common';
import { SportsService } from './sports.service';
import { SportsController } from './sports.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { resultSport } from './entities/sports.entity';

@Module({
  imports: [TypeOrmModule.forFeature([resultSport])],
  controllers: [SportsController],
  providers: [SportsService]
})
export class SportsModule {}
