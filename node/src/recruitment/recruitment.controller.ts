import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { RecruitmentService } from './recruitment.service';
import { CreateRecruitmentDto } from './dto/create-recruitment.dto';
import { UpdateRecruitmentDto } from './dto/update-recruitment.dto';

@Controller('recruitment')
export class RecruitmentController {
  constructor(private readonly recruitmentService: RecruitmentService) {}

  @Post()
  create(@Body() createRecruitmentDto: CreateRecruitmentDto) {
    return this.recruitmentService.create(createRecruitmentDto);
  }

  @Get()
  findAll() {
    return this.recruitmentService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.recruitmentService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateRecruitmentDto: UpdateRecruitmentDto) {
    return this.recruitmentService.update(+id, updateRecruitmentDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.recruitmentService.remove(+id);
  }
}
