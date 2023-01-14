part of '../product_page.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Modular.get<ProductController>();

    return Container(
      height: 110.h,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 171, 46, 29),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Observer(
          builder: (context) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 60.h,
                  width: 80.w,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.increment();
                        },
                        child: Container(
                          height: 25.h,
                          width: 25.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF49134),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          controller.item.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.decrement();
                        },
                        child: Container(
                          height: 25.h,
                          width: 25.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF49134),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.addToCard()) {
                      final controller = Modular.get<CartController>();
                      final controllerProduct =
                          Modular.get<ProductController>();
                      controller.resetTotal();
                      controller.sumTotal(controllerProduct.cartList);
                      Modular.to.navigate('/auth/order_page');
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF49134),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50.h,
                    width: 230.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                          child: const VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                        ),
                        Text(
                          '\$ ${(controller.priceTotaly + controller.priceAdditional + controller.priceBorder).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
