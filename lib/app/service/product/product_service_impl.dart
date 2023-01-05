// ignore_for_file: public_member_api_docs, sort_constructors_first
import './product_service.dart';
import '../../repositories/product/product_repository.dart';

class ProductServiceImpl implements ProductService {
  final ProductRepository _productRespository;

  ProductServiceImpl({
    required ProductRepository productRespository,
  }) : _productRespository = productRespository;

  @override
  Future<Map<String, dynamic>> getPizza(int id) =>
      _productRespository.getPizza(id);
}
