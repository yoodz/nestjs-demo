import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller('fuck')
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }


  @Get('any')
  async getData() {
    return new Promise(res => {
      setTimeout(() => {
        res('after 3s')
      }, 3000);
    })
  }
}
