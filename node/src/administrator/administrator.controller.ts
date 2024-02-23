import { Controller, Get, Body, Patch, Query, ParseIntPipe, Param } from '@nestjs/common';
import { AdministratorService } from './administrator.service';
import { FE_getAdministratorDto, FE_updateAdministratorDto } from './dto/administrator.dto';

@Controller('administrator')
export class AdministratorController {
  constructor(private readonly administratorService: AdministratorService) {}

  @Get()
  getReserveAdministrator(@Query() params: FE_getAdministratorDto) {
    return this.administratorService.getReserveAdministrator(params);
  }

  @Patch()
  updateReserveAdministrator(@Body() params: FE_updateAdministratorDto) {
    return this.administratorService.updateReserveAdministrator(params);
  }
}
