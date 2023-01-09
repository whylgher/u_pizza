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
                  child: Image.network(controller.drinks[index].image),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    controller.drinks[index].name,
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
                    'U\$ ${controller.drinks[index].price.toStringAsFixed(2)}',
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
