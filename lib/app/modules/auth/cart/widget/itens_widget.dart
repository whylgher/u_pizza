part of '../cart_page.dart';

class ItensWidget extends StatelessWidget {
  // static final pizzaData = ListViewPizzasWidget.pizza.toMap();

  const ItensWidget({Key? key}) : super(key: key);

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
            image: NetworkImage('url_img'),
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
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
                  '1',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10.sp, color: Colors.black),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'name',
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
              'subtitle',
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
              '3 unit(s)',
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
              'U\$ 12',
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
