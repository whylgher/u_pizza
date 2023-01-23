part of '../address_page.dart';

class AddressWidget extends StatelessWidget {
  final String street;
  final bool selected;

  const AddressWidget({
    Key? key,
    required this.street,
    required this.selected,
  }) : super(key: key);

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
          Visibility(
            visible: selected,
            child: UPizzaIcons.location(
              height: 25.h,
              color: Colors.red.shade400,
            ),
          ),
          Visibility(
            visible: !selected,
            child: Container(
              alignment: Alignment.center,
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey.shade400,
                  width: .5,
                ),
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFF7F8FA),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            street,
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
