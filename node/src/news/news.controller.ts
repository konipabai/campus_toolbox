import { Controller, Get, Post, Body, Query } from '@nestjs/common';
import { NewsService } from './news.service';
import { FE_getNewsDto } from './dto/news.dto';

@Controller('news')
export class NewsController {
  constructor(private readonly newsService: NewsService) { }

  @Get()
  getNews(@Query() params: FE_getNewsDto) {
    return this.newsService.getNews(params);
  }
}
