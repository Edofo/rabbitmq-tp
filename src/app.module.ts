import { Module } from '@nestjs/common';
import { RabbitMQModule } from './modules/rabbitmq/rabbitmq.module';
import { NotificationsModule } from './modules/notifications/notifications.module';
import { UsersModule } from './modules/users/users.module';

@Module({
  imports: [RabbitMQModule, NotificationsModule, UsersModule],
})
export class AppModule {}
