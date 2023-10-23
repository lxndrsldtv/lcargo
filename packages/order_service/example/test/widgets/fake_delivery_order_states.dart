import 'package:order_service/src/models/delivery_order_view_model.dart';

// enum

const deliveryOrderViewModel1 = DeliveryOrderViewModel(
  stateColor: 0xff02598a,
  stateDescription: 'Ожидает расчета',
  id: '1234567890123',
  pathStartPoint: 'Шанхай',
  pathEndPoint: 'Москва',
  comment: 'Среднее время расчета: 1 час',
);

const deliveryOrderViewModel2 = DeliveryOrderViewModel(
  stateColor: 0xFFEBC051,
  stateDescription: 'Ожидает выбора варианта доставки',
  id: '1234567890123',
  pathStartPoint: 'Шанхай',
  pathEndPoint: 'Москва',
  comment: 'Рассчитан 23 марта 2023 г.',
);

const deliveryOrderViewModel3 = DeliveryOrderViewModel(
  stateColor: 0xFFEBC051,
  stateDescription: 'Ожидает получения на складе',
  id: '1234567890123',
  pathStartPoint: 'Шанхай',
  pathEndPoint: 'Москва',
  comment: 'Рассчитан 23 марта 2023 г.',
);

const deliveryOrderViewModel4 = DeliveryOrderViewModel(
  stateColor: 0xffF25656,
  stateDescription: 'Ожидает отправки со склада в Китае',
  id: '1234567890123',
  pathStartPoint: 'Шанхай',
  pathEndPoint: 'Москва',
  comment: 'Получен на складе 23 марта 2023 г.',
);

const deliveryOrderViewModel5 = DeliveryOrderViewModel(
  stateColor: 0xffF25656,
  stateDescription: 'В пути',
  id: '1234567890123',
  pathStartPoint: 'Шанхай',
  pathEndPoint: 'Москва',
  comment: 'Плановая дата доставки: 23 марта 2023 г.',
);

const deliveryOrderViewModel6 = DeliveryOrderViewModel(
  stateColor: 0xffF25656,
  stateDescription: 'Проехал Алматы',
  id: '1234567890123',
  pathStartPoint: 'Шанхай',
  pathEndPoint: 'Москва',
  comment: 'Плановая дата доставки: 23 марта 2023 г.',
);

const deliveryOrderViewModel7 = DeliveryOrderViewModel(
  stateColor: 0xff039C25,
  stateDescription: 'Доставлен на склад в Москве',
  id: '1234567890123',
  pathStartPoint: 'Шанхай',
  pathEndPoint: 'Москва',
  comment: 'Доставлен 23 марта 2023 г.',
);

const deliveryOrderViewModel8 = DeliveryOrderViewModel(
  stateColor: 0xff039C25,
  stateDescription: 'Выдан',
  id: '1234567890123',
  pathStartPoint: 'Шанхай',
  pathEndPoint: 'Москва',
  comment: 'Выдан 23 марта 2023 г.',
);

const deliveryOrderViewModel9 = DeliveryOrderViewModel(
  stateColor: 0xff039C25,
  stateDescription: 'Отменен',
  id: '1234567890123',
  pathStartPoint: 'Шанхай',
  pathEndPoint: 'Москва',
  comment: 'Отменен 23 марта 2023 г.',
);
