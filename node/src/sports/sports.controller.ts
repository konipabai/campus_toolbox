import { Controller, Get, Post, Body, Query, Headers } from '@nestjs/common';
import { SportsService } from './sports.service';
import { FE_getSportsDto, FE_postSportsDto } from './dto/sports.dto';
import * as jwt from 'jsonwebtoken';

@Controller('sports')
export class SportsController {
  constructor(private readonly sportsService: SportsService) {}

  @Get()
  getSports(@Query() params: FE_getSportsDto) {
    return this.sportsService.getSports(params);
  }

  @Post()
  postSports(@Headers() headers: any, @Body() params: FE_postSportsDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.sportsService.postSports(params);
  }
}
