import { Injectable } from '@nestjs/common';
import { CreateRecruitmentDto } from './dto/create-recruitment.dto';
import { UpdateRecruitmentDto } from './dto/update-recruitment.dto';

@Injectable()
export class RecruitmentService {
  create(createRecruitmentDto: CreateRecruitmentDto) {
    return 'This action adds a new recruitment';
  }

  findAll() {
    return `This action returns all recruitment`;
  }

  findOne(id: number) {
    return `This action returns a #${id} recruitment`;
  }

  update(id: number, updateRecruitmentDto: UpdateRecruitmentDto) {
    return `This action updates a #${id} recruitment`;
  }

  remove(id: number) {
    return `This action removes a #${id} recruitment`;
  }
}
