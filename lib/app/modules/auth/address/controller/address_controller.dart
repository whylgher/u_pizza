import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

import '../../../../models/address_model.dart';
import '../../../../service/address/address_service.dart';

part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store {
  final AddressService _addressService;

  AddressControllerBase({
    required AddressService addressService,
  }) : _addressService = addressService;

  @observable
  late Position currentPosition;
  @observable
  late Placemark placemarks;
  @observable
  var addresses = <AddressModel>[].asObservable();

  @action
  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    currentPosition = await Geolocator.getCurrentPosition();
    List<Placemark> c = (await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude));
    placemarks = c[0];
  }

  @action
  Future<void> getAllAddresses() async {
    final c = await _addressService.getAllAddresses();
    List<dynamic> addressesList = c['data'];
    for (var address in addressesList) {
      AddressModel d = AddressModel.fromMap(address);
      addresses.add(d);
    }
  }
}
