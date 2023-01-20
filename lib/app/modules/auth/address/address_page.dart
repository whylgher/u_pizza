import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/widgets/app_bar_default_widget.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefaultWidget(
        action: () => Modular.to.navigate('/auth/menu'),
        label: 'Address',
      ),
      body: Container(),
    );
  }
}
