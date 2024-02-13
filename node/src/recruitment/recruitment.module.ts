import { Module } from '@nestjs/common';
import { RecruitmentService } from './recruitment.service';
import { RecruitmentController } from './recruitment.controller';

@Module({
  controllers: [RecruitmentController],
  providers: [RecruitmentService]
})
export class RecruitmentModule {}
