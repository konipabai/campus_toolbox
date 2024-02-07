import { Module } from '@nestjs/common';
import { FaultService } from './fault.service';
import { FaultController } from './fault.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { resultFault } from './entities/fault.entity';

@Module({
  imports: [TypeOrmModule.forFeature([resultFault])],
  controllers: [FaultController],
  providers: [FaultService]
})
export class FaultModule { }
