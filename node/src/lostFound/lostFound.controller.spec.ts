import { Test, TestingModule } from '@nestjs/testing';
import { LostFoundController } from './lostFound.controller';
import { LostFoundService } from './lostFound.service';

describe('LostFoundController', () => {
  let controller: LostFoundController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [LostFoundController],
      providers: [LostFoundService],
    }).compile();

    controller = module.get<LostFoundController>(LostFoundController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
