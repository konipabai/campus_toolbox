import { Controller, Get, Query } from '@nestjs/common';
import { UserService } from './user.service';
import { FE_getUserDto } from './dto/user.dto';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get()
  getUser(@Query() params: FE_getUserDto) {
    return this.userService.getUser(params);
  }
}
