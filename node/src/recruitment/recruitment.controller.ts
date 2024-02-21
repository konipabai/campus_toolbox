import { Body, Controller, Get, Post, Query } from '@nestjs/common';
import { RecruitmentService } from './recruitment.service';
import { FE_getRecruitmentDto, FE_postRecruitmentDto } from './dto/recruitment.dto';

@Controller('recruitment')
export class RecruitmentController {
  constructor(private readonly recruitmentService: RecruitmentService) {}

  @Get()
  getRecruitment(@Query() params: FE_getRecruitmentDto) {
    return this.recruitmentService.getRecruitment(params);
  }

  
  @Post()
  postRecruitment(@Body() params: FE_postRecruitmentDto) {
    return this.recruitmentService.postRecruitment(params);
  }
}
