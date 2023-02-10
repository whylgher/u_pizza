part of '../make_pizza_page.dart';

class CheesePizzaView extends StatelessWidget {
  final Size sizeDevice;

  const CheesePizzaView({
    Key? key,
    required this.sizeDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Now in the second step, choose the amount of sauce and cheese.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: sizeDevice.width * .65,
            child: const Image(
              image: NetworkImage(
                  'https://quemservicos.com.br/u_pizzas/make_pizza/droast_pizza.png'),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const TitleAddItems(
            title: 'Sauce',
          ),
          SizedBox(
            height: 20.h,
          ),
          DropDownSauceWidget(),
          SizedBox(
            height: 20.h,
          ),
          const ItemSelectWidget(
            label: 'Cheese',
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
