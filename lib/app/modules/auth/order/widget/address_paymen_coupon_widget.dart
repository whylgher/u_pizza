part of '../order_page.dart';

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
          DottedBorder(
            color: Colors.grey.shade600,
            strokeWidth: 1.5,
            dashPattern: const [8, 4],
            child: SizedBox(
              height: 45.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'Choose how you want to pay?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.w,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Coupon'),
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
                Text(
                  'Do you have a coupon?',
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
            height: 15.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Items'),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Add more items',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
