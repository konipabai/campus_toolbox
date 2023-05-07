import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const options = new DocumentBuilder().setTitle('校园百宝箱接口文档').setDescription('本项目所有接口').build()
  const document = SwaggerModule.createDocument(app,options)
  SwaggerModule.setup('/api-docs', app, document)
  await app.listen(3000);
}
bootstrap();
