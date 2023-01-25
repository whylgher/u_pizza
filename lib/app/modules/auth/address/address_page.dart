import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        label: 'Addresses',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.h),
              child: Observer(
                builder: (_) {
                  return Column(
                    children: [
                      TitleWidget(),
                      SizedBox(
                        height: 15.w,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (_, __) => Divider(height: 20.h),
                        itemCount: controller.addresses.length,
                        itemBuilder: (context, index) {
                          final address = controller.addresses[index];
                          return GestureDetector(
                            onTap: () {
                              controller.setAddress(address.id);
                              controller.getAllAddresses();
                            },
                            child: AddressWidget(
                              street: address.street,
                              selected:
                                  address.id == controller.addressSelected,
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
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
              onPressed: () => Modular.to.navigate('/auth/address/new'),
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
