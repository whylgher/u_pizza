abstract class AddressRepository {
  Future<Map> getAllAddresses();
  Future<void> addNewAddress(Map map);
}
