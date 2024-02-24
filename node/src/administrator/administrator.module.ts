import { Module } from '@nestjs/common';
import { AdministratorService } from './administrator.service';
import { AdministratorController } from './administrator.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { resultClassroom } from 'src/classroom/entities/classroom.entity';
import { resultUser } from 'src/user/entities/user.entity';
import { resultFault } from 'src/fault/entities/fault.entity';
import { resultLostFound } from 'src/lostFound/entities/lostFound.entity';
import { resultRecruitment } from 'src/recruitment/entities/recruitment.entity';

@Module({
  imports: [TypeOrmModule.forFeature([resultClassroom, resultUser, resultFault, resultLostFound, resultRecruitment])],
  controllers: [AdministratorController],
  providers: [AdministratorService]
})
export class AdministratorModule {}
