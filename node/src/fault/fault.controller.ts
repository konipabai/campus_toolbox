import { Controller, Get, Post, Body, Patch, Param, Delete, Query, ParseIntPipe, Headers } from '@nestjs/common';
import { FaultService } from './fault.service';
import { FE_postFaultDto, FE_getFaultDto, FE_deleteFaultDto } from './dto/fault.dto';
import * as jwt from 'jsonwebtoken';

@Controller('fault')
export class FaultController {
  constructor(private readonly faultService: FaultService) { }

  @Get()
  getFault(@Headers() headers: any, @Query() params: FE_getFaultDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.faultService.getFault(params);
  }

  @Post()
  postFault(@Headers() headers: any, @Body() params: FE_postFaultDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.faultService.postFault(params);
  }

  @Patch()
  updateFault(@Headers() headers: any, @Body() params: FE_postFaultDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.faultService.updateFault(params);
  }

  @Delete()
  deleteFault(@Headers() headers: any, @Query() params: FE_deleteFaultDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.faultService.deleteFault(params);
  }
}
