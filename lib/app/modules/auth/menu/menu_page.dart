import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import 'widgets/app_bar_menu_widget.dart';
import 'widgets/card_widget.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeDevide = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarMenuWidget(),
      body: Column(
        children: [
          SizedBox(
            height: (sizeDevide.height / 2).h * .1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: sizeDevide.height * .4.h,
            child: Column(
              children: [
                CardWidget(
                  iconLeading: const Icon(Icons.list_alt_outlined),
                  title: 'Orders',
                  titleSize: 15,
                  action: () {
                    Modular.to.navigate('/auth/order');
                  },
                ),
                const CardWidget(
                  iconLeading: Icon(Icons.chat_outlined),
                  title: 'Chat',
                  titleSize: 15,
                ),
                const CardWidget(
                  iconLeading: Icon(Icons.notifications_outlined),
                  title: 'Notification',
                  titleSize: 15,
                ),
                const CardWidget(
                  iconLeading: Icon(Icons.payments_outlined),
                  title: 'Payments',
                  titleSize: 15,
                ),
                const CardWidget(
                  iconLeading: Icon(Icons.location_on_outlined),
                  title: 'Address',
                  titleSize: 15,
                ),
                const CardWidget(
                  iconLeading: Icon(Icons.account_box_outlined),
                  title: 'Account',
                  titleSize: 15,
                ),
                const CardWidget(
                  iconLeading: Icon(Icons.logout_outlined),
                  title: 'Logout',
                  titleSize: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: (sizeDevide.height / 5).h * .1,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            height: sizeDevide.height * .1.h,
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
