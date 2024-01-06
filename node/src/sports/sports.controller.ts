import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { SportsService } from './sports.service';
import { FE_getSportsDto, FE_postSportsDto } from './dto/sports.dto';

@Controller('sports')
export class SportsController {
  constructor(private readonly sportsService: SportsService) {}

  @Get()
  getSports(@Query() params: FE_getSportsDto) {
    return this.sportsService.getSports(params);
  }

  @Post()
  postSports(@Body() params: FE_postSportsDto) {
    return this.sportsService.postSports(params);
  }
}
