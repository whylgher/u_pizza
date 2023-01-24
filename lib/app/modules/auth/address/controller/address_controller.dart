import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/local_storage/local_storage.dart';
import '../../../../models/address_model.dart';
import '../../../../models/user_model.dart';
import '../../../../service/address/address_service.dart';

part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store {
  final AddressService _addressService;
  final LocalStorage _localStorage;

  AddressControllerBase({
    required AddressService addressService,
    required LocalStorage localStorage,
  })  : _addressService = addressService,
        _localStorage = localStorage;

  @observable
  late Position currentPosition;
  @observable
  late Placemark placemarks;
  @observable
  late int addressSelected = 0;
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
    addresses.removeRange(0, addresses.length);
    final c = await _addressService.getAllAddresses();
    List<dynamic> addressesList = c['data'];
    for (var address in addressesList) {
      AddressModel d = AddressModel.fromMap(address);
      addresses.add(d);
    }
    final selected = await _localStorage.read(Constants.ADDRESS_SELECTED);

    if (selected >= 0) {
      setAddress(selected);
    }
  }

  @action
  Future<void> setAddress(int id) async {
    await _localStorage.write(Constants.ADDRESS_SELECTED, id);
    addressSelected = id;
  }

  @action
  Future<void> addNewAddress({
    required String street,
    required String countryCode,
    required String country,
    required String postalCode,
    required String locality,
  }) async {
    final userData = jsonDecode(
        await _localStorage.read(Constants.LOCAL_STORAGE_USER_LOGGED_DATA));

    final user = UserModel.fromMap(userData);

    Map newAddress = {
      "user_id": user.data['id'],
      "street": street,
      "country_code": countryCode,
      "country": country,
      "postal_code": postalCode,
      "locality": locality,
      "latlng": "${currentPosition.latitude} ${currentPosition.longitude}"
    };

    try {
      await _addressService.addNewAddress(newAddress);
      Modular.to.navigate('/auth/address');
    } on Exception catch (e) {
      throw Error();
    }
  }
}
