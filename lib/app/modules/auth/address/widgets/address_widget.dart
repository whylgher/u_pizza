part of '../address_page.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
