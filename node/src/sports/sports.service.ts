import { Injectable } from '@nestjs/common';
import { FE_getSportsDto, FE_postSportsDto } from './dto/sports.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { resultSport } from './entities/sports.entity';
import { Repository } from 'typeorm';

@Injectable()
export class SportsService {
  constructor(
    @InjectRepository(resultSport) private readonly sportsResult: Repository<resultSport>
  ) { }

  async getSports(params: FE_getSportsDto) {
    return 'This action adds a new sport';
  }

  async postSports(params: FE_postSportsDto) {
    return `This action returns all sports`;
  }
}
