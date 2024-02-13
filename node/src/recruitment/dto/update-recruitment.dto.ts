import { PartialType } from '@nestjs/swagger';
import { CreateRecruitmentDto } from './create-recruitment.dto';

export class UpdateRecruitmentDto extends PartialType(CreateRecruitmentDto) {}
