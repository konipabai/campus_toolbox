import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
import { ClassroomModule } from './classroom/classroom.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { LostFoundModule } from './lostFound/lostFound.module';
import { SeatModule } from './seat/seat.module';
import { SportsModule } from './sports/sports.module';

@Module({
  imports: [UserModule, ClassroomModule, TypeOrmModule.forRoot({
    type: "mysql",
    username: "root",
    password: "123456",
    host: "localhost",
    port: 3306,
    database: "campus_toolbox",
    entities: [__dirname + '/**/*.entity{.ts,.js}'],
    synchronize: true,
    retryDelay: 500,
    retryAttempts: 10,
    autoLoadEntities: true,
  }), LostFoundModule, SeatModule, SportsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
