part of '../address_page.dart';

class TitleWidget extends StatelessWidget {
  bool selectAddress;

  TitleWidget({
    Key? key,
    this.selectAddress = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectAddress ? 'Other Addresses' : 'Delivery Address',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
            ),
          ),
          Visibility(
            visible: selectAddress,
            child: Text(
              'Selected main address',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
