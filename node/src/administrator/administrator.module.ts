import { Module } from '@nestjs/common';
import { AdministratorService } from './administrator.service';
import { AdministratorController } from './administrator.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { resultClassroom } from 'src/classroom/entities/classroom.entity';
import { resultUser } from 'src/user/entities/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([resultClassroom, resultUser])],
  controllers: [AdministratorController],
  providers: [AdministratorService]
})
export class AdministratorModule {}
