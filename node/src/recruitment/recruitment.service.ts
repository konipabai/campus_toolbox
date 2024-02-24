import { Injectable } from '@nestjs/common';
import { BE_filterRecruitmentDto, DB_resultRecruitmentDto, FE_getRecruitmentDto } from './dto/recruitment.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Between, Like, Repository } from 'typeorm';
import { resultRecruitment } from './entities/recruitment.entity';

@Injectable()
export class RecruitmentService {
  constructor(
    @InjectRepository(resultRecruitment) private readonly recruitmentResult: Repository<resultRecruitment>
  ) { }

  async getRecruitment(params: FE_getRecruitmentDto) {
    var findRecruitmentData: BE_filterRecruitmentDto[] = []
    try {
      const whereCondition: any = {}
      if (params.job !== '') {
        whereCondition.job = Like(`%${params.job}%`)
      }
      if (!(params.bottom.toString() == '0' && params.top.toString() == '0')) {
        if (parseInt(params.bottom.toString()) > parseInt(params.top.toString())) {
          whereCondition.salary = Between(params.top, params.bottom)
        } else {
          whereCondition.salary = Between(params.bottom, params.top)
        }
      }
      var tempRecruitment: DB_resultRecruitmentDto[] = await this.recruitmentResult.find()
      tempRecruitment.map(item => {
        findRecruitmentData.push({
          id: item.id,
          name: item.name,
          hr: item.hr,
          job: item.job,
          description: item.description,
          salary: item.salary,
          requirements: item.requirements.split('||'),
          benefits: item.benefits,
          contact: item.contact,
          location: item.location
        })
      })
    } catch (error) {
      console.log(error);
    }
    return findRecruitmentData;
  }
}
