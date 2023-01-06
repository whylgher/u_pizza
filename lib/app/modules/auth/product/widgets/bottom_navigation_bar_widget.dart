part of '../product_page.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({Key? key}) : super(key: key);

  final _controller = Modular.get<ProductController>();

  @override
  Widget build(BuildContext context) {
    _controller.priceTotaly = ProductPage.dataPizza['prices'][0]['regular'];
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
          builder: (_) {
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
                          _controller.increment();
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
                        width: 25.w,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          _controller.value.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.decrement();
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
                    Modular.to.navigate('/auth/order_page');
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
                          'Add to card',
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
                          'U\$ ${_controller.pricefinally}',
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
