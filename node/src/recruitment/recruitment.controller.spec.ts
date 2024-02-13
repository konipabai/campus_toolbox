import { Test, TestingModule } from '@nestjs/testing';
import { RecruitmentController } from './recruitment.controller';
import { RecruitmentService } from './recruitment.service';

describe('RecruitmentController', () => {
  let controller: RecruitmentController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [RecruitmentController],
      providers: [RecruitmentService],
    }).compile();

    controller = module.get<RecruitmentController>(RecruitmentController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
