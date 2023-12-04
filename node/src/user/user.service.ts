import { Injectable } from '@nestjs/common';

@Injectable()
export class UserService {
  findOne(account: string) {
    return `This action returns a #${account} user`;
  }
}
