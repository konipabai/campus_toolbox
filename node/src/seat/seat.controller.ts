import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { SeatService } from './seat.service';
import { FE_getSeatDto } from './dto/seat.dto';

@Controller('seat')
export class SeatController {
  constructor(private readonly seatService: SeatService) {}

  @Get()
  getSeat(@Query() params: FE_getSeatDto) {
    return this.seatService.getSeat(params);
  }

  @Post()
  create(@Body() createSeatDto) {
    return this.seatService.create(createSeatDto);
  }
}
