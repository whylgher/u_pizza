import './address_service.dart';
import '../../repositories/address/address_repository.dart';

class AddressServiceImpl implements AddressService {
  final AddressRepository _addressRepository;
  AddressServiceImpl({
    required AddressRepository addressRepository,
  }) : _addressRepository = addressRepository;

  @override
  Future<Map> getAllAddresses() => _addressRepository.getAllAddresses();

  @override
  Future<void> addNewAddress(Map map) => _addressRepository.addNewAddress(map);
}
