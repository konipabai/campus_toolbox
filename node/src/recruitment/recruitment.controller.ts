import { Body, Controller, Get, Query } from '@nestjs/common';
import { RecruitmentService } from './recruitment.service';
import { FE_getRecruitmentDto } from './dto/recruitment.dto';

@Controller('recruitment')
export class RecruitmentController {
  constructor(private readonly recruitmentService: RecruitmentService) {}

  @Get()
  getRecruitment(@Query() params: FE_getRecruitmentDto) {
    return this.recruitmentService.getRecruitment(params);
  }
}
