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

  @observable
  double priceTotaly = 0;

  @observable
  late double pricefinally = priceTotaly;

  @observable
  int value = 1;

  @action
  void increment() {
    if (value < 5) {
      value++;
    }
  }

  @action
  void decrement() {
    if (value != 1) {
      value--;
    }
  }

  @action
  double setPrice(double value) {
    priceTotaly = value;
    return priceTotaly;
  }

  @action
  void icrement() {
    priceTotaly = priceTotaly++;
  }

  @action
  Future<void> getPizza(int id) async {
    var data = await _productService.getPizza(id);
    pizza = ObservableList<dynamic>.of([data]);
    Loader.show();
  }
}
