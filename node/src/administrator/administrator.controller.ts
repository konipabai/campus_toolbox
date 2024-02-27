import { Controller, Get, Body, Patch, Query, Delete, Post, Headers } from '@nestjs/common';
import { AdministratorService } from './administrator.service';
import { FE_deleteRecruitmentAdministratorDto, FE_getAdministratorDto, FE_postRecruitmentAdministratorDto, FE_updateClassroomAdministratorDto, FE_updateFaultAdministratorDto, FE_updateLFAdministratorDto } from './dto/administrator.dto';
import * as jwt from 'jsonwebtoken';

@Controller('administrator')
export class AdministratorController {
  constructor(private readonly administratorService: AdministratorService) { }

  @Get()
  getOrderAdministrator(@Headers() headers: any, @Query() params: FE_getAdministratorDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.administratorService.getOrderAdministrator(params);
  }

  @Post()
  postOrderAdministrator(@Headers() headers: any, @Body() params: FE_postRecruitmentAdministratorDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.administratorService.postOrderAdministrator(params);
  }

  @Patch()
  updateOrderAdministrator(@Headers() headers: any, @Body() params: FE_updateClassroomAdministratorDto | FE_updateFaultAdministratorDto | FE_updateLFAdministratorDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.administratorService.updateOrderAdministrator(params);
  }

  @Delete()
  deleteOrderAdministrator(@Headers() headers: any, @Query() params: FE_deleteRecruitmentAdministratorDto) {
    const tokenData = jwt.verify(headers.token as string, 'test');
    params.account = (tokenData as jwt.JwtPayload).account
    return this.administratorService.deleteOrderAdministrator(params);
  }
}
