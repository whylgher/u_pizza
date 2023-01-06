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
  double price = 0;

  @observable
  late double priceTotaly = price;

  @observable
  int item = 1;

  @action
  void increment() {
    if (item < 5) {
      item++;
      priceTotaly = price * item;
    }
  }

  @action
  void decrement() {
    if (item > 1) {
      item--;
      priceTotaly = price * item;
    }
  }

  @observable
  bool cutPizza = true;

  @action
  void cutInHalf() {
    cutPizza = true;
  }

  @action
  void notCutPizza() {
    cutPizza = false;
  }

  @observable
  bool regular = true;
  bool large = false;

  @action
  void sizePizzaLarge() {
    regular = false;
    large = true;
  }

  @action
  void sizePizzaRegular() {
    regular = true;
    large = false;
  }

  @action
  void set() {
    item = 1;
    priceTotaly = price;
  }

  @action
  Future<void> getPizza(int id) async {
    var data = await _productService.getPizza(id);
    pizza = ObservableList<dynamic>.of([data]);
    Loader.show();
  }
}
