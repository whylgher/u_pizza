import './cart_service.dart';
import '../../repositories/cart/cart_repository.dart';

class CartServiceImpl implements CartService {
  final CartRepository _cartRepository;
  CartServiceImpl({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> purchase(Map<String, dynamic> map) =>
      _cartRepository.purchase(map);
}
