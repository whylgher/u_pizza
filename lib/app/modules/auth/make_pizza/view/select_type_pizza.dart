part of '../make_pizza_page.dart';

class SelectTypePizza extends StatelessWidget {
  final Size sizeDevice;
  final bool leftSide;
  const SelectTypePizza({
    Key? key,
    required this.sizeDevice,
    this.leftSide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<MakePizzaController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'In the first step, choose the desired type.',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => Divider(height: 20.h),
            itemCount: controller.pizzas.length,
            itemBuilder: (_, index) {
              return TypePizza(
                leftSide: index.isOdd,
                sizeDevice: sizeDevice,
                pizza: controller.pizzas[index],
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}

class TypePizza extends StatelessWidget {
  final Size sizeDevice;
  final bool leftSide;
  final MakePizza pizza;
  const TypePizza({
    Key? key,
    required this.sizeDevice,
    this.leftSide = false,
    required this.pizza,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => MakePizzaPage.controller.nextPage(
            duration: const Duration(seconds: 1),
            curve: Curves.ease,
          )),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: sizeDevice.height * .2,
        width: sizeDevice.width * .9,
        decoration: BoxDecoration(
          color: context.primaryColor,
          image: DecorationImage(
            alignment: Alignment(leftSide ? -1.5.w : 1.5.h, 0.h),
            image: NetworkImage(
              pizza.image,
            ),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              leftSide ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              pizza.name,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 77, 0, 0),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
              endIndent: leftSide ? 1 : 200,
              indent: leftSide ? 200 : 1,
            ),
            Row(
              mainAxisAlignment:
                  leftSide ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Text(
                  pizza.sauce.toString(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 77, 0, 0),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Sauce + ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  pizza.cheese.toString(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 77, 0, 0),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Cheese',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
                  leftSide ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: pizza.topping != 0,
                  child: Row(
                    children: [
                      Text(
                        pizza.topping.toString(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 77, 0, 0),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Topping',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: pizza.viggie != 0 && pizza.topping != 0,
                  child: const Text(' + '),
                ),
                Visibility(
                  visible: pizza.viggie != 0,
                  child: Row(
                    children: [
                      Text(
                        pizza.viggie.toString(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 77, 0, 0),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Viggie',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              '\$ ${pizza.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 77, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
