part of '../order_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
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
                    'U\$ 38,80',
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
              indent: 20,
              endIndent: 20,
              height: 5,
            ),
            SizedBox(
              height: 30.h,
              width: sizeDevice.width * .85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Discount Coupon',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'U\$ 8,80',
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
                    'U\$ 30,80',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
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
        ),
      ),
    );
  }
}
