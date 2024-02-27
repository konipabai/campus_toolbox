import { Controller, Get, Body, Patch, Delete, Query, Headers } from '@nestjs/common';
import { RecordsService } from './records.service';
import { FE_resultClassroomDto, FE_resultSeatDto, FE_resultSportsDto, FE_getRecordsDto, FE_deleteRecordsDto } from './dto/record.dto';
import * as jwt from 'jsonwebtoken';

@Controller('records')
export class RecordsController {
  constructor(private readonly recordsService: RecordsService) { }

  @Get()
  getRecords(@Headers() headers: any, @Query() params: FE_getRecordsDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.recordsService.getRecords(params);
  }

  // @Patch()
  // updateRecords(@Body() params: FE_resultClassroomDto | FE_resultSeatDto | FE_resultSportsDto) {
  //   return this.recordsService.updateRecords(params);
  // }

  @Delete()
  deleteRecords(@Headers() headers: any, @Query() params: FE_deleteRecordsDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.recordsService.deleteRecords(params);
  }
}
