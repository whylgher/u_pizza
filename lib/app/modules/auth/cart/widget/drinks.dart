part of '../cart_page.dart';

class Drinks extends StatelessWidget {
  Drinks({Key? key}) : super(key: key);

  final controller = Modular.get<CartController>();
  final controllerProduct = Modular.get<ProductController>();

  @override
  Widget build(BuildContext context) {
    var sizeDevice = MediaQuery.of(context).size;
    return Container(
      width: sizeDevice.width,
      height: 210.h,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => Divider(height: 20.h),
        itemCount: controller.drinks.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            width: 135.w,
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
          );
        }),
      ),
    );
  }
}
