import { Injectable } from '@nestjs/common';
import { FE_getNewsDto, BE_filterNewsDto } from './dto/news.dto';
import * as cheerio from 'cheerio'
import axios from 'axios';

@Injectable()
export class NewsService {
  async getNews(params: FE_getNewsDto): Promise<BE_filterNewsDto[] | string> {
    try {
      const tempNews: string = await axios.get(params.url).then(res => res.data)
      const $: cheerio.CheerioAPI = cheerio.load(tempNews)

      if (params.detail == 'false') {
        const newsList: BE_filterNewsDto[] = [];
        const baseUrl: string = 'https://www.nuit.edu.cn'
        $('.list-page-tp li').each((index, element) => {
          const title: string = $(element).find('.title .tit').text().trim()
          const link: string = $(element).find('.title .tit').attr('href').trim()
          const img: string = $(element).find('.pic a img').attr('src').trim()
          const description: string = $(element).find('.intro').text().trim()
          const date: string = $(element).find('.others .date').text().trim()
          const newsItem: BE_filterNewsDto = {
            title: title,
            description: description,
            date: date,
            imgUrl: img.includes(baseUrl) ? img : baseUrl + img,
            detailUrl: link.includes(baseUrl) ? link : baseUrl + link
          }
          newsList.push(newsItem)
        });
        return newsList;
      } else {
        let tempData: cheerio.Cheerio<cheerio.Element> = $('.printArea')
        tempData.find('span:contains("浏览次数")').remove();
        tempData.find('span:contains("【字体")').remove();
        tempData.find('img[src="https://www.nuit.edu.cn/Admin/Content/Assets/UEditor/themes/default/images/spacer.gif"]').remove();
        tempData.find('.title').remove();
        return tempData.html().toString().replaceAll('src="/upload', 'src="https://www.nuit.edu.cn/upload')
      }
    } catch (error) {
      console.log(error);
    }
  }
}
