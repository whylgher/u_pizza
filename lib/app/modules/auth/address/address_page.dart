import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/icons/u_pizza_icons.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';
import 'controller/address_controller.dart';

part 'widgets/address_widget.dart';
part 'widgets/title_widget.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AddressController>();
    final sizeDevice = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarDefaultWidget(
        action: () => Modular.to.navigate('/auth/menu'),
        label: 'Address',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.h),
              child: Column(
                children: [
                  TitleWidget(),
                  SizedBox(
                    height: 5.w,
                  ),
                  const AddressWidget(),
                  Divider(height: 20.h),
                  TitleWidget(
                    selectAddress: true,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  const AddressWidget(),
                ],
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
                controller.getAllAddresses();
              },
              backgroundColor: context.primaryColor,
              label: Text(
                'Add a new address',
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
