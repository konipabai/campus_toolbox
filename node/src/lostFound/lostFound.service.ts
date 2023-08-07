import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BE_filterLostFoundDto, DB_resultLostFoundDto } from './dto/lostFound.dto';
import { resultLostFound } from './entities/lostFound.entity';

@Injectable()
export class LostFoundService {
  constructor(
    @InjectRepository(resultLostFound) private readonly lostFoundResult: Repository<resultLostFound>
  ) { }

  async getLostFound() {
    var lostFoundData: BE_filterLostFoundDto[] = []
    try {
      const tempLostFound: DB_resultLostFoundDto[] = await this.lostFoundResult.find()
      lostFoundData = tempLostFound.map((lostFoundItem) => ({
        name: "(" + lostFoundItem.state + ")\n" + lostFoundItem.item,
        value: 1,
        brand: lostFoundItem.brand,
        location: lostFoundItem.location,
        description: lostFoundItem.description,
        contact: lostFoundItem.contact
      }))
    } catch (error) {
      console.log(error);
    }
    return lostFoundData
  }


  create(BE_filterLostFoundDto: BE_filterLostFoundDto) {
    return 'This action adds a new lostFound';
  }

  findAll() {
    return `This action returns all lostFound`;
  }

  findOne(id: number) {
    return `This action returns a #${id} lostFound`;
  }

  update(id: number, BE_filterLostFoundDto: BE_filterLostFoundDto) {
    return `This action updates a #${id} lostFound`;
  }

  remove(id: number) {
    return `This action removes a #${id} lostFound`;
  }
}
