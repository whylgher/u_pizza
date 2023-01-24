abstract class AddressService {
  Future<Map> getAllAddresses();
  Future<void> addNewAddress(Map map);
}
