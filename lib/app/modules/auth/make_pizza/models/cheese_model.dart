import 'package:mobx/mobx.dart';

part 'cheese_model.g.dart';

class CheeseModelStore = CheeseModelBase with _$CheeseModelStore;

abstract class CheeseModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  double price;
  @observable
  bool selected;

  CheeseModelBase({
    required this.id,
    required this.name,
    required this.price,
    this.selected = false,
  });
}
