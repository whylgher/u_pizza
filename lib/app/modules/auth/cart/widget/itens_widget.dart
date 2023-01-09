// ignore_for_file: must_be_immutable

part of '../cart_page.dart';

class ItensWidget extends StatelessWidget {
  String name;
  String description;
  String item;
  int unitys;
  String image;
  double total;

  ItensWidget({
    Key? key,
    required this.name,
    required this.description,
    required this.item,
    required this.unitys,
    required this.image,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeDevice = MediaQuery.of(context).size;
    return Container(
      width: sizeDevice.width,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          scale: .5,
          alignment: Alignment(1.2.w, 0.h),
          image: NetworkImage(image),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
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
                child: Text(
                  item,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10.sp, color: Colors.black),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            width: sizeDevice.width * .65,
            child: Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.sp,
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              '$unitys unit(s)',
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            width: sizeDevice.width * .7,
            child: Text(
              'U\$ $total',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
