import { Module } from '@nestjs/common';
import { FaultService } from './fault.service';
import { FaultController } from './fault.controller';

@Module({
  controllers: [FaultController],
  providers: [FaultService]
})
export class FaultModule {}
