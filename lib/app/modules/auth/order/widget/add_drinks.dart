part of '../order_page.dart';

class AddDrinks extends StatelessWidget {
  const AddDrinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeDevice = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Want to add some drink?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          width: sizeDevice.width,
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 135.w,
                  height: 180.h,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: .5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F8FA),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5.h),
                        height: 110.h,
                        child: Image.network(
                          'https://static.wixstatic.com/media/0adaee_284f45c0fe394abebadcfcd9c103b363~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Coca Cola',
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
                        width: sizeDevice.width * .7,
                        child: Text(
                          'U\$ 3,50',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 135.w,
                  height: 180.h,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: .5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F8FA),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5.h),
                        height: 110.h,
                        child: Image.network(
                          'https://static.wixstatic.com/media/0adaee_284f45c0fe394abebadcfcd9c103b363~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Coca Cola',
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
                        width: sizeDevice.width * .7,
                        child: Text(
                          'U\$ 3,50',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 135.w,
                  height: 180.h,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: .5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F8FA),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5.h),
                        height: 110.h,
                        child: Image.network(
                          'https://static.wixstatic.com/media/0adaee_284f45c0fe394abebadcfcd9c103b363~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Coca Cola',
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
                        width: sizeDevice.width * .7,
                        child: Text(
                          'U\$ 3,50',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 135.w,
                  height: 180.h,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: .5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F8FA),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5.h),
                        height: 110.h,
                        child: Image.network(
                          'https://static.wixstatic.com/media/0adaee_284f45c0fe394abebadcfcd9c103b363~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Coca Cola',
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
                        width: sizeDevice.width * .7,
                        child: Text(
                          'U\$ 3,50',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 135.w,
                  height: 180.h,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: .5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F8FA),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5.h),
                        height: 110.h,
                        child: Image.network(
                          'https://static.wixstatic.com/media/0adaee_284f45c0fe394abebadcfcd9c103b363~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Coca Cola',
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
                        width: sizeDevice.width * .7,
                        child: Text(
                          'U\$ 3,50',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 135.w,
                  height: 180.h,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: .5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F8FA),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5.h),
                        height: 110.h,
                        child: Image.network(
                          'https://static.wixstatic.com/media/0adaee_284f45c0fe394abebadcfcd9c103b363~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Coca Cola',
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
                        width: sizeDevice.width * .7,
                        child: Text(
                          'U\$ 3,50',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
