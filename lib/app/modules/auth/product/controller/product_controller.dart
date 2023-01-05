// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import '../../../../core/ui/widgets/loader.dart';
import '../../../../service/product/product_service.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final ProductService _productService;

  ProductControllerBase({
    required ProductService productService,
  }) : _productService = productService;

  @observable
  ObservableList<dynamic> pizza = ObservableList<dynamic>.of([]);

  @action
  Future<void> getPizza(int id) async {
    var data = await _productService.getPizza(id);
    pizza = ObservableList<dynamic>.of([data]);
    Loader.show();
  }
}
