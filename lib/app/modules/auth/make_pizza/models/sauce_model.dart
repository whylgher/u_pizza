import 'package:mobx/mobx.dart';

part 'sauce_model.g.dart';

class SauceModelStore = SauceModelBase with _$SauceModelStore;

abstract class SauceModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  double price;
  @observable
  bool selected;

  SauceModelBase({
    required this.id,
    required this.name,
    required this.price,
    this.selected = false,
  });
}
