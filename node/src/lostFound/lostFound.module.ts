import { Module } from '@nestjs/common';
import { LostFoundService } from './lostFound.service';
import { LostFoundController } from './lostFound.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { resultLostFound } from './entities/lostFound.entity';

@Module({
  imports: [TypeOrmModule.forFeature([resultLostFound])],
  controllers: [LostFoundController],
  providers: [LostFoundService]
})
export class LostFoundModule { }
