part of '../make_pizza_page.dart';

class VegetablesAndCheesesView extends StatelessWidget {
  final Size sizeDevice;
  const VegetablesAndCheesesView({
    Key? key,
    required this.sizeDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<MakePizzaController>();
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
            spacing: 10.w,
            runSpacing: 10.h,
            alignment: WrapAlignment.center,
            children: controller.veggies
                .map((veggie) => VegetableAndOthersWidget(
                      label: veggie.name,
                      sizeDevice: sizeDevice,
                    ))
                .toList(),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
