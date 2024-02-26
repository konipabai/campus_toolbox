import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { resultUser } from './entities/user.entity';
import { Repository } from 'typeorm';
import { BE_filterUserDto, DB_resultUserDto, FE_getUserDto } from './dto/user.dto';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(resultUser) private readonly userResult: Repository<resultUser>
  ) { }

  async getUser(params: FE_getUserDto): Promise<BE_filterUserDto> {
    var findUserData: BE_filterUserDto = {
      account: '',
      name: '',
      class: '',
      administrator: ''
    }
    try {
      var tempUser: DB_resultUserDto
      tempUser = await this.userResult.findOne({
        where: {
          account: params.account
        }
      })
      if (tempUser != null && tempUser.password == params.password) {
        findUserData = {
          account: tempUser.account,
          name: tempUser.name,
          class: tempUser.class,
          administrator: tempUser.administrator
        }
      } else {
        findUserData = {
          account: '',
          name: '',
          class: '',
          administrator: ''
        }
      }
    } catch (error) {
      findUserData = {
        account: '',
        name: '',
        class: '',
        administrator: ''
      }
      console.log(error);
    }
    return findUserData;
  }
}
