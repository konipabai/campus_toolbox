import { Controller, Get, Post, Body, Patch, Param, Delete, Query } from '@nestjs/common';
import { LostFoundService } from './lostFound.service';
import { BE_filterLostFoundDto, FE_postLostFoundDto, FE_getLostFoundDto } from './dto/lostFound.dto';

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

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.lostFoundService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() BE_filterLostFoundDto: BE_filterLostFoundDto) {
    return this.lostFoundService.update(+id, BE_filterLostFoundDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.lostFoundService.remove(+id);
  }
}
