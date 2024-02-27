import { Controller, Get, Post, Body, Patch, Param, Delete, Query, ParseIntPipe, Headers } from '@nestjs/common';
import { LostFoundService } from './lostFound.service';
import { FE_postLostFoundDto, FE_getLostFoundDto, FE_deleteLostFoundDto } from './dto/lostFound.dto';
import * as jwt from 'jsonwebtoken';

@Controller('lostFound')
export class LostFoundController {
  constructor(private readonly lostFoundService: LostFoundService) { }

  @Get()
  getLostFound(@Headers() headers: any, @Query() params: FE_getLostFoundDto) {
    if (params.account) {
      const tokenData = jwt.verify(headers.token as string, 'test');
      params.account = (tokenData as jwt.JwtPayload).account
    }
    return this.lostFoundService.getLostFound(params);
  }

  @Post()
  postLostFound(@Headers() headers: any, @Body() params: FE_postLostFoundDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.lostFoundService.postLostFound(params);
  }

  @Patch()
  updateLostFound(@Headers() headers: any, @Body() params: FE_postLostFoundDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.lostFoundService.updateLostFound(params);
  }

  @Delete()
  deleteLostFound(@Headers() headers: any, @Query() params: FE_deleteLostFoundDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.lostFoundService.deleteLostFound(params);
  }
}
