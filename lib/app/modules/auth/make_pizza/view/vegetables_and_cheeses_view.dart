part of '../make_pizza_page.dart';

class VegetablesAndCheesesView extends StatelessWidget {
  final Size sizeDevice;
  const VegetablesAndCheesesView({
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
            title: 'Vegetables and other cheeses',
          ),
          SizedBox(
            height: 5.h,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 20.w,
            runSpacing: 20.h,
            alignment: WrapAlignment.center,
            children: [
              VegetableAndOthersWidget(
                label: 'Black Olives',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Cream Cheese',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Gorgonzola',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Pepper',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Champignom',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Corn',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Basil',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Quail Egg',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Oregano',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Onion',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Parmesan',
                sizeDevice: sizeDevice,
              ),
              VegetableAndOthersWidget(
                label: 'Tomato',
                sizeDevice: sizeDevice,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
