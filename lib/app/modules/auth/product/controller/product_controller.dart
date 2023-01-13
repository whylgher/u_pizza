// ignore_for_file: avoid_print

import 'package:mobx/mobx.dart';

import '../../../../models/additional_model.dart';
import '../../../../models/border_model.dart';
import '../../../../models/cart_model.dart';
import '../../../../models/pizza_model.dart';
import '../../../../service/product/product_service.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final ProductService _productService;

  ProductControllerBase({
    required ProductService productService,
  }) : _productService = productService;

  @observable
  late PizzaModel pizzaModel = PizzaModel.setNull();
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
  List<dynamic> itemAdditional = [];
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
  @observable
  ObservableList<AdditionalModel> additionalList =
      ObservableList<AdditionalModel>.of([]);
  @observable
  ObservableList<CartModel> cardList = ObservableList<CartModel>.of([]);
  @observable
  ObservableList<BorderModel> bordersList = ObservableList<BorderModel>.of([]);

  @action
  void selectBorder(int index) {
    for (var border in bordersList) {
      border.select = false;
    }
    bordersList[index].select = true;
    priceBorder = bordersList[index].price;
    updatePage();
  }

  @action
  void updatePage() {
    if (regular == true) {
      sizePizzaRegular();
    } else {
      sizePizzaLarge();
    }
  }

  @action
  void addAdditional(int index) {
    if (additionalList[index].count < 2) {
      additionalList[index].count++;
      priceAdditional = priceAdditional + additionalList[index].price;
      additionalList[index] = additionalList[index];
    }
  }

  @action
  void removeAdditional(int index) {
    if (additionalList[index].count > 0) {
      additionalList[index].count--;
      priceAdditional = priceAdditional - additionalList[index].price;
      additionalList[index] = additionalList[index];
    }
  }

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
    priceTotaly = price * item;
  }

  @action
  void resetAll() {
    priceAdditional = 0;
    priceBorder = 0;
    itemAdditional = [];
    bordersList = ObservableList<BorderModel>.of([]);
    sizePizzaRegular();

    item = 1;
    priceTotaly = price * item;
    additionalList = ObservableList<AdditionalModel>.of([]);
  }

  @action
  bool addToCard() {
    CartModel c = CartModel.fromMap(generateMap());
    cardList.add(c);
    return true;
  }

  @action
  Map<String, dynamic> generateMap() {
    var typeBorder = '';
    for (var border in bordersList) {
      if (border.select == true) {
        typeBorder = border.name;
      }
    }
    return {
      'id': pizzaModel.id,
      'name': pizzaModel.name,
      'description': pizzaModel.description,
      'img': pizzaModel.image,
      'cut': cutPizza,
      'size': regular ? 'regular' : 'large',
      'border': typeBorder,
      'additional': additionalList,
      'amountPizzas': item,
      'amount': priceTotaly + priceAdditional + priceBorder,
    };
  }

  @action
  void removeItenCart(int index) {
    cardList.removeWhere((item) => item.id == index);
  }

  @action
  Future<bool> getPizza(int id) async {
    var data = await _productService.getPizza(id);
    pizzaModel = PizzaModel.fromMap(data);
    additionals = data['additionals'];
    borders = data['borders'];
    price = pizzaModel.regular;
    set();
    for (var additional in pizzaModel.additionals) {
      AdditionalModel c = AdditionalModel.fromMap(additional);
      additionalList.add(c);
    }
    for (var border in pizzaModel.borders) {
      BorderModel c = BorderModel.fromMap(border);
      bordersList.add(c);
      if (c.name.toLowerCase() == 'simple') {
        c.select = true;
      }
    }
    // Loader.hide();
    return true;
  }
}
