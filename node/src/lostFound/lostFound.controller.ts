import { Controller, Get, Post, Body, Patch, Param, Delete, Query, ParseIntPipe } from '@nestjs/common';
import { LostFoundService } from './lostFound.service';
import { FE_postLostFoundDto, FE_getLostFoundDto } from './dto/lostFound.dto';

@Controller('lostFound')
export class LostFoundController {
  constructor(private readonly lostFoundService: LostFoundService) { }

  @Get()
  getLostFound(@Query() params: FE_getLostFoundDto) {
    return this.lostFoundService.getLostFound(params);
  }

  @Post()
  postLostFound(@Body() FE_postLostFoundDto: FE_postLostFoundDto) {
    return this.lostFoundService.postLostFound(FE_postLostFoundDto);
  }

  @Patch(':id')
  updateLostFound(@Param('id', ParseIntPipe) id: number, @Body() FE_updateLostFoundDto: FE_postLostFoundDto) {
    return this.lostFoundService.updateLostFound(id, FE_updateLostFoundDto);
  }

  @Delete(':id')
  deleteLostFound(@Param('id', ParseIntPipe) id: number) {
    return this.lostFoundService.deleteLostFound(id);
  }
}
