import { Controller, Post, Body } from '@nestjs/common';
import { NotificationsService } from './notifications.service';
import { NotificationDto } from './notifications.dto';

@Controller('notifications')
export class NotificationsController {
  constructor(private readonly notificationsService: NotificationsService) {}

  @Post('send')
  async sendNotification(@Body() notificationDto: NotificationDto) {
    await this.notificationsService.sendNotification(notificationDto);
    return 'Notification sent to RabbitMQ';
  }
}
