import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FaultService } from './fault.service';
import { CreateFaultDto } from './dto/create-fault.dto';
import { UpdateFaultDto } from './dto/update-fault.dto';

@Controller('fault')
export class FaultController {
  constructor(private readonly faultService: FaultService) {}

  @Post()
  create(@Body() createFaultDto: CreateFaultDto) {
    return this.faultService.create(createFaultDto);
  }

  @Get()
  findAll() {
    return this.faultService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.faultService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateFaultDto: UpdateFaultDto) {
    return this.faultService.update(+id, updateFaultDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.faultService.remove(+id);
  }
}
