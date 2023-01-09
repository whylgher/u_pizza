import './drink_service.dart';
import '../../repositories/drink/drink_repository.dart';

class DrinkServiceImpl implements DrinkService {
  final DrinkRepository _drinkRepository;

  DrinkServiceImpl({
    required DrinkRepository drinkRepository,
  }) : _drinkRepository = drinkRepository;

  @override
  Future getDrinks() => _drinkRepository.getDrinks();
}
