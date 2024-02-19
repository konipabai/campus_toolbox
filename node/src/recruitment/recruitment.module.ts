import { Module } from '@nestjs/common';
import { RecruitmentService } from './recruitment.service';
import { RecruitmentController } from './recruitment.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { resultRecruitment } from './entities/recruitment.entity';

@Module({
  imports: [TypeOrmModule.forFeature([resultRecruitment])],
  controllers: [RecruitmentController],
  providers: [RecruitmentService]
})
export class RecruitmentModule {}
