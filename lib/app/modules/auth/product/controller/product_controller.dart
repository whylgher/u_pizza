// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import '../../../../service/product/product_service.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final ProductService _productService;

  ProductControllerBase({
    required ProductService productService,
  }) : _productService = productService;

  @observable
  Map pizza = {};
  @observable
  List<dynamic> borders = [];
  @observable
  List<dynamic> additionals = [];
  @observable
  double price = 0;
  @observable
  double priceAdditional = 0;
  @observable
  double priceBorder = 0;
  @observable
  int itemAdditional = 0;
  @observable
  late double priceTotaly = price;
  @observable
  int item = 1;
  @observable
  bool cutPizza = true;
  @observable
  bool regular = true;
  @observable
  bool large = false;

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

  @action
  void incrementAdditional(double value) {
    priceAdditional = priceAdditional + value;
  }

  @action
  void decrementAdditional(double value) {
    priceAdditional = priceAdditional - value;
  }

  @action
  void cutInHalf() {
    cutPizza = true;
  }

  @action
  void notCutPizza() {
    cutPizza = false;
  }

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
    priceAdditional = 0;
    priceBorder = 0;
    itemAdditional = 0;
    item = 1;
    priceTotaly = price * item;
  }

  @action
  Future<void> getPizza(int id) async {
    var data = await _productService.getPizza(id);
    pizza = data['pizza'];
    additionals = data['additionals'];
    borders = data['borders'];
    // Loader.show();
  }
}
