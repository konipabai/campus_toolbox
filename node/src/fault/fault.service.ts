import { Injectable } from '@nestjs/common';
import { CreateFaultDto } from './dto/create-fault.dto';
import { UpdateFaultDto } from './dto/update-fault.dto';

@Injectable()
export class FaultService {
  create(createFaultDto: CreateFaultDto) {
    return 'This action adds a new fault';
  }

  findAll() {
    return `This action returns all fault`;
  }

  findOne(id: number) {
    return `This action returns a #${id} fault`;
  }

  update(id: number, updateFaultDto: UpdateFaultDto) {
    return `This action updates a #${id} fault`;
  }

  remove(id: number) {
    return `This action removes a #${id} fault`;
  }
}
