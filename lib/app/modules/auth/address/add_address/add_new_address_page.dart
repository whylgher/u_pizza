import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:u_pizzas/app/core/ui/extensions/size_screen_extension.dart';
import 'package:u_pizzas/app/core/ui/extensions/theme_extension.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/icons/u_pizza_icons.dart';
import '../../../../core/ui/widgets/app_bar_default_widget.dart';
import '../../../../core/ui/widgets/u_pizza_text_form_field.dart';
import '../controller/address_controller.dart';

class AddNewAddressPage extends StatelessWidget {
  AddNewAddressPage({Key? key}) : super(key: key);

  final streetEC = TextEditingController();
  final localityEC = TextEditingController();
  final postalCodeEC = TextEditingController();
  final countryEC = TextEditingController();
  final countryCodeEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AddressController>();
    final sizeDevice = MediaQuery.of(context).size;

    Future<void> checkPermission() async {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission != LocationPermission.unableToDetermine) {
        streetEC.text = controller.placemarks.street.toString();
        countryEC.text = controller.placemarks.country.toString();
        countryCodeEC.text = controller.placemarks.isoCountryCode.toString();
        localityEC.text = controller.placemarks.locality.toString();
        postalCodeEC.text = controller.placemarks.postalCode.toString();
      }
    }

    checkPermission();
    return Scaffold(
      appBar: AppBarDefaultWidget(
        action: () => Modular.to.navigate('/auth/address'),
        label: 'New Address',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(15.h),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add new address',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.w,
                    ),
                    UPizzaTextFormField(
                      label: 'Complete Street',
                      isNumber: true,
                      controller: streetEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('required street'),
                        Validatorless.min(5, 'invalid street'),
                      ]),
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: sizeDevice.width * .55,
                          child: UPizzaTextFormField(
                            label: 'Locality',
                            isNumber: true,
                            controller: localityEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('required locality'),
                              Validatorless.min(3, 'invalid locality'),
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        SizedBox(
                          width: sizeDevice.width * .35,
                          child: UPizzaTextFormField(
                            label: 'Postal Code',
                            isNumber: true,
                            controller: postalCodeEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('required postal code'),
                              Validatorless.min(2, 'invalid postal code'),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: sizeDevice.width * .65,
                          child: UPizzaTextFormField(
                            label: 'Country',
                            isNumber: true,
                            controller: countryEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('required country'),
                              Validatorless.min(3, 'invalid country'),
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        SizedBox(
                          width: sizeDevice.width * .25,
                          child: UPizzaTextFormField(
                            label: 'Code',
                            isNumber: true,
                            controller: countryCodeEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('required country code'),
                              Validatorless.min(2, 'invalid country code'),
                            ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: sizeDevice.height * .8,
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton.extended(
              extendedIconLabelSpacing: 20,
              icon: const Icon(
                UPizzaIcons.right_circle,
                color: Color(0xFFED4631),
                size: 30,
              ),
              onPressed: () {
                final formValid = _formKey.currentState?.validate() ?? false;
                if (formValid) {
                  controller.addNewAddress(
                    street: streetEC.text,
                    countryCode: countryCodeEC.text,
                    country: countryEC.text,
                    postalCode: postalCodeEC.text,
                    locality: localityEC.text,
                  );
                }
              },
              backgroundColor: context.primaryColor,
              label: Text(
                'Save new address',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
