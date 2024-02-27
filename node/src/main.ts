import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';
import { NextFunction, Request, Response } from 'express';
import * as jwt from 'jsonwebtoken';

const verificationToken: string[] = [
  '/classroom',
  '/lostFound',
  '/seat',
  '/sports',
  '/fault',
  '/news',
  '/recruitment',
  '/records'
]

function MiddleWareAll(req: Request, res: Response, next: NextFunction) {
  try {
    if (req.path == '/user') {
      next()
    } else {
      const tokenData = jwt.verify(req.headers.token as string, 'test');
      if ((tokenData as jwt.JwtPayload).flag == 'powered by konipabai') {
        if (verificationToken.includes(req.path)) {
          next()
        } else if (req.path == '/administrator') {
          if ((tokenData as jwt.JwtPayload).administrator == 'true') {
            next()
          } else {
            return res.status(401).json({ message: '非管理员身份,token无效' });
          }
        } else {
          return res.status(404).json({ message: '非法地址' });
        }
      } else {
        return res.status(401).json({ message: 'token无效' });
      }
    }
  } catch {
    return res.status(401).json({ message: 'token无效' });
  }
}

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const options = new DocumentBuilder().setTitle('校园百宝箱接口文档').setDescription('本项目所有接口').build()
  const document = SwaggerModule.createDocument(app, options)
  SwaggerModule.setup('/api-docs', app, document)
  app.use(MiddleWareAll)
  await app.listen(3000);
}
bootstrap();
