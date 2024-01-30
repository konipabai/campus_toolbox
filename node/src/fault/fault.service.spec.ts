import { Test, TestingModule } from '@nestjs/testing';
import { FaultService } from './fault.service';

describe('FaultService', () => {
  let service: FaultService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [FaultService],
    }).compile();

    service = module.get<FaultService>(FaultService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
