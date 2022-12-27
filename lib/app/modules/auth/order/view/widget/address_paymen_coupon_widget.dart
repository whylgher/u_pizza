part of '../order_view.dart';

class AddressPaymenCouponWidget extends StatelessWidget {
  const AddressPaymenCouponWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Delivery Address'),
          ),
          SizedBox(
            height: 5.w,
          ),
          Container(
            height: 55.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                UPizzaIcons.location(height: 25.h, color: Colors.red.shade400),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  '1801 W Hillsobor, Deerfield Beach',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.w,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Payment'),
          ),
          SizedBox(
            height: 5.w,
          ),
          Container(
            height: 55.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Credit Card',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'Paid by app',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      UPizzaIcons.creditCard(),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        '**** 3589',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Items'),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
