import { Test, TestingModule } from '@nestjs/testing';
import { FaultController } from './fault.controller';
import { FaultService } from './fault.service';

describe('FaultController', () => {
  let controller: FaultController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [FaultController],
      providers: [FaultService],
    }).compile();

    controller = module.get<FaultController>(FaultController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
