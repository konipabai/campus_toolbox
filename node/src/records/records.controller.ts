import { Controller, Get, Post, Body, Patch, Param, Delete, Query, ParseIntPipe } from '@nestjs/common';
import { RecordsService } from './records.service';
import { FE_resultClassroomDto, FE_resultSeatDto, FE_resultSportsDto, FE_getRecordsDto, FE_deleteRecordsDto } from './dto/record.dto';

@Controller('records')
export class RecordsController {
  constructor(private readonly recordsService: RecordsService) { }

  @Get()
  getRecords(@Query() params: FE_getRecordsDto) {
    return this.recordsService.getRecords(params);
  }

  // @Patch()
  // updateRecords(@Body() params: FE_resultClassroomDto | FE_resultSeatDto | FE_resultSportsDto) {
  //   return this.recordsService.updateRecords(params);
  // }

  @Delete()
  deleteRecords(@Query() params: FE_deleteRecordsDto) {
    return this.recordsService.deleteRecords(params);
  }
}
