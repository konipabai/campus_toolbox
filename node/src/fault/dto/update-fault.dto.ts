import { PartialType } from '@nestjs/swagger';
import { CreateFaultDto } from './create-fault.dto';

export class UpdateFaultDto extends PartialType(CreateFaultDto) {}
