part of '../make_pizza_page.dart';

class ProteinPizzaView extends StatelessWidget {
  final Size sizeDevice;

  const ProteinPizzaView({
    Key? key,
    required this.sizeDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Now in the third step, choose a protein',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Stack(
            children: [
              SizedBox(
                width: sizeDevice.width * .65,
                child: const Image(
                  image: NetworkImage(
                      'https://quemservicos.com.br/u_pizzas/make_pizza/droast_pizza.png'),
                ),
              ),
              SizedBox(
                width: sizeDevice.width * .65,
                child: const Image(
                  image: NetworkImage(
                    'https://quemservicos.com.br/u_pizzas/make_pizza/pepperoni.png',
                    scale: 0.75,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          const TitleAddItems(
            title: 'Choose your protein',
            subTitle: 'Select 1',
            required: true,
          ),
          SizedBox(
            height: 5.h,
          ),
          const ItemSelectWidget(
            label: 'Pepperoni',
          ),
          SizedBox(
            height: 10.h,
          ),
          const ItemSelectWidget(
            label: 'Pepperoni',
          ),
          SizedBox(
            height: 10.h,
          ),
          const ItemSelectWidget(
            label: 'Pepperoni',
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
