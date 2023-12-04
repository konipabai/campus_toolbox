import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { resultUser } from './entities/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([resultUser])],
  controllers: [UserController],
  providers: [UserService]
})
export class UserModule {}
