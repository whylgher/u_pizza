part of '../order_view.dart';

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
      height: sizeDevice.height * .2,
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
          ],
        ),
      ),
    );
  }
}
