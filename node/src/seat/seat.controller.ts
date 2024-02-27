import { Controller, Get, Post, Body, Query, Headers } from '@nestjs/common';
import { SeatService } from './seat.service';
import { FE_getSeatDto, FE_postSeatDto } from './dto/seat.dto';
import * as jwt from 'jsonwebtoken';

@Controller('seat')
export class SeatController {
  constructor(private readonly seatService: SeatService) { }

  @Get()
  getSeat(@Query() params: FE_getSeatDto) {
    return this.seatService.getSeat(params);
  }

  @Post()
  postSeat(@Headers() headers: any, @Body() params: FE_postSeatDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.seatService.postSeat(params);
  }
}
