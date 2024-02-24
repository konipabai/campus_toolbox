import { Controller, Get, Body, Patch, Query, Delete, Post } from '@nestjs/common';
import { AdministratorService } from './administrator.service';
import { FE_deleteRecruitmentAdministratorDto, FE_getAdministratorDto, FE_postRecruitmentAdministratorDto, FE_updateClassroomAdministratorDto, FE_updateFaultAdministratorDto, FE_updateLFAdministratorDto } from './dto/administrator.dto';

@Controller('administrator')
export class AdministratorController {
  constructor(private readonly administratorService: AdministratorService) {}

  @Get()
  getOrderAdministrator(@Query() params: FE_getAdministratorDto) {
    return this.administratorService.getOrderAdministrator(params);
  }

  @Post()
  postOrderAdministrator(@Body() params: FE_postRecruitmentAdministratorDto) {
    return this.administratorService.postOrderAdministrator(params);
  }

  @Patch()
  updateOrderAdministrator(@Body() params: FE_updateClassroomAdministratorDto | FE_updateFaultAdministratorDto | FE_updateLFAdministratorDto) {
    return this.administratorService.updateOrderAdministrator(params);
  }

  @Delete()
  deleteOrderAdministrator(@Query() params: FE_deleteRecruitmentAdministratorDto) {
    return this.administratorService.deleteOrderAdministrator(params);
  }
}
