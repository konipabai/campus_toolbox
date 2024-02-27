import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { resultUser } from './entities/user.entity';
import { Repository } from 'typeorm';
import { BE_filterUserDto, DB_resultUserDto, FE_getUserDto } from './dto/user.dto';
import * as jwt from 'jsonwebtoken';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(resultUser) private readonly userResult: Repository<resultUser>
  ) { }

  async getUser(params: FE_getUserDto): Promise<{ findUserData: BE_filterUserDto; token: string; }> {
    var findUserData: BE_filterUserDto = {
      account: '',
      name: '',
      class: '',
      administrator: ''
    }
    let token: string = ''
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
        token = jwt.sign({
          account: findUserData.account,
          name: findUserData.name,
          class: findUserData.class,
          administrator: findUserData.administrator,
          flag: 'powered by konipabai'
        }, 'test');
      } else {
        findUserData = {
          account: '',
          name: '',
          class: '',
          administrator: ''
        }
        token = '';
      }
    } catch (error) {
      findUserData = {
        account: '',
        name: '',
        class: '',
        administrator: ''
      }
      token = '';
      console.log(error);
    }
    return { findUserData, token };
  }
}
