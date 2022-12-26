part of '../make_pizza_page.dart';

class SizePizzaView extends StatelessWidget {
  final dynamic sizeDevice;
  const SizePizzaView({
    Key? key,
    required this.sizeDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'In the first step, choose the desired size.',
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
                  'https://quemservicos.com.br/u_pizzas/make_pizza/raw_pizza.png'),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const TitleAddItems(
            title: 'Choose your size',
            subTitle: 'Choose one',
            required: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          PizzaAddedItens(label: '9" Regular', price: 'FREE'),
          SizedBox(
            height: 10.h,
          ),
          PizzaAddedItens(label: '12" Regular', price: 'U\$ 25,00'),
          SizedBox(
            height: 10.h,
          ),
          PizzaAddedItens(label: '15" Regular', price: 'U\$ 28,00'),
          SizedBox(
            height: 10.h,
          ),
          PizzaAddedItens(label: '18" Regular', price: 'U\$ 32,00'),
        ],
      ),
    );
  }
}
