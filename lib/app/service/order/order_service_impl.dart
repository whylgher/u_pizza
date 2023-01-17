import './order_service.dart';
import '../../repositories/order/order_repository.dart';

class OrderServiceImpl implements OrderService {
  OrderRepository _orderRepository;

  OrderServiceImpl({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<Map<String, dynamic>> getOrders(int id) =>
      _orderRepository.getOrders(id);
}
