import { Module } from '@nestjs/common';
import { AppModule } from './app/app.module'

@Module({
  imports: [AppModule],
})
export default class DefaultModule {}
