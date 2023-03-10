part of '../cart_page.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<CartController>();
    var sizeDevice = MediaQuery.of(context).size;

    return Container(
      height: sizeDevice.height * .3,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Observer(
          builder: (_) {
            return Column(
              children: [
                SizedBox(
                  height: 30.h,
                  width: sizeDevice.width * .85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$ ${controller.total.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                ),
                SizedBox(
                  height: 20.h,
                  width: sizeDevice.width * .85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Tax',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$ ${(controller.total * .07).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 30.h,
                    width: sizeDevice.width * .85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$ ${((controller.total * .07) + controller.total).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (await controller.placeOrders()) {
                          Modular.to.navigate('/auth/order');
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF49134),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 50.h,
                          width: sizeDevice.width * .85,
                          child: Center(
                            child: Text(
                              'Purchase',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
