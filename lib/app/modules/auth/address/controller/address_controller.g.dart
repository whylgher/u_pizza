// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressController on AddressControllerBase, Store {
  late final _$currentPositionAtom =
      Atom(name: 'AddressControllerBase.currentPosition', context: context);

  @override
  Position get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$placemarksAtom =
      Atom(name: 'AddressControllerBase.placemarks', context: context);

  @override
  Placemark get placemarks {
    _$placemarksAtom.reportRead();
    return super.placemarks;
  }

  @override
  set placemarks(Placemark value) {
    _$placemarksAtom.reportWrite(value, super.placemarks, () {
      super.placemarks = value;
    });
  }

  late final _$addressSelectedAtom =
      Atom(name: 'AddressControllerBase.addressSelected', context: context);

  @override
  int get addressSelected {
    _$addressSelectedAtom.reportRead();
    return super.addressSelected;
  }

  @override
  set addressSelected(int value) {
    _$addressSelectedAtom.reportWrite(value, super.addressSelected, () {
      super.addressSelected = value;
    });
  }

  late final _$addressesAtom =
      Atom(name: 'AddressControllerBase.addresses', context: context);

  @override
  ObservableList<AddressModel> get addresses {
    _$addressesAtom.reportRead();
    return super.addresses;
  }

  @override
  set addresses(ObservableList<AddressModel> value) {
    _$addressesAtom.reportWrite(value, super.addresses, () {
      super.addresses = value;
    });
  }

  late final _$addressTextAtom =
      Atom(name: 'AddressControllerBase.addressText', context: context);

  @override
  String get addressText {
    _$addressTextAtom.reportRead();
    return super.addressText;
  }

  @override
  set addressText(String value) {
    _$addressTextAtom.reportWrite(value, super.addressText, () {
      super.addressText = value;
    });
  }

  late final _$determinePositionAsyncAction =
      AsyncAction('AddressControllerBase.determinePosition', context: context);

  @override
  Future<void> determinePosition() {
    return _$determinePositionAsyncAction.run(() => super.determinePosition());
  }

  late final _$getAllAddressesAsyncAction =
      AsyncAction('AddressControllerBase.getAllAddresses', context: context);

  @override
  Future<void> getAllAddresses() {
    return _$getAllAddressesAsyncAction.run(() => super.getAllAddresses());
  }

  late final _$getIdAddressStorageAsyncAction = AsyncAction(
      'AddressControllerBase.getIdAddressStorage',
      context: context);

  @override
  Future<void> getIdAddressStorage() {
    return _$getIdAddressStorageAsyncAction
        .run(() => super.getIdAddressStorage());
  }

  late final _$setAddressAsyncAction =
      AsyncAction('AddressControllerBase.setAddress', context: context);

  @override
  Future<void> setAddress(int id) {
    return _$setAddressAsyncAction.run(() => super.setAddress(id));
  }

  late final _$addNewAddressAsyncAction =
      AsyncAction('AddressControllerBase.addNewAddress', context: context);

  @override
  Future<void> addNewAddress(
      {required String street,
      required String countryCode,
      required String country,
      required String postalCode,
      required String locality}) {
    return _$addNewAddressAsyncAction.run(() => super.addNewAddress(
        street: street,
        countryCode: countryCode,
        country: country,
        postalCode: postalCode,
        locality: locality));
  }

  @override
  String toString() {
    return '''
currentPosition: ${currentPosition},
placemarks: ${placemarks},
addressSelected: ${addressSelected},
addresses: ${addresses},
addressText: ${addressText}
    ''';
  }
}
