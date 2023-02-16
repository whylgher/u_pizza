import 'package:mobx/mobx.dart';

part 'tooping_model.g.dart';

class ToopingModelStore = ToopingModelBase with _$ToopingModelStore;

abstract class ToopingModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  double price;
  @observable
  bool selected;

  ToopingModelBase({
    required this.id,
    required this.name,
    required this.price,
    this.selected = false,
  });
}
