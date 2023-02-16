import 'package:mobx/mobx.dart';

part 'veggie_model.g.dart';

class VeggieModelStore = VeggieModelBase with _$VeggieModelStore;

abstract class VeggieModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  double price;
  @observable
  bool selected;

  VeggieModelBase({
    required this.id,
    required this.name,
    required this.price,
    this.selected = false,
  });
}
