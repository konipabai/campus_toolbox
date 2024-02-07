import { Controller, Get, Post, Body, Patch, Param, Delete, Query, ParseIntPipe } from '@nestjs/common';
import { FaultService } from './fault.service';
import { FE_postFaultDto, FE_getFaultDto } from './dto/fault.dto';

@Controller('fault')
export class FaultController {
  constructor(private readonly faultService: FaultService) { }

  @Get()
  getfault(@Query() params: FE_getFaultDto) {
    return this.faultService.getFault(params);
  }

  @Post()
  postfault(@Body() FE_postfaultDto: FE_postFaultDto) {
    return this.faultService.postFault(FE_postfaultDto);
  }

  @Patch(':id')
  updatefault(@Param('id', ParseIntPipe) id: number, @Body() FE_updatefaultDto: FE_postFaultDto) {
    return this.faultService.updateFault(id, FE_updatefaultDto);
  }

  @Delete(':id')
  deletefault(@Param('id', ParseIntPipe) id: number) {
    return this.faultService.deleteFault(id);
  }
}
