part of '../make_pizza_page.dart';

class SelectTypePizza extends StatelessWidget {
  final Size sizeDevice;
  final bool leftSide;
  const SelectTypePizza({
    Key? key,
    required this.sizeDevice,
    this.leftSide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'In the first step, choose the desired type.',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          TypePizza(sizeDevice: sizeDevice),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}

class TypePizza extends StatelessWidget {
  final Size sizeDevice;
  final bool leftSide;
  const TypePizza({
    Key? key,
    required this.sizeDevice,
    this.leftSide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: sizeDevice.height * .2,
      width: sizeDevice.width * .9,
      decoration: BoxDecoration(
        color: context.primaryColor,
        image: DecorationImage(
          alignment: Alignment(leftSide ? -1.5.w : 1.5.h, 0.h),
          image: const NetworkImage(
            'https://static.vecteezy.com/system/resources/previews/009/384/620/original/fresh-pizza-and-pizza-box-clipart-design-illustration-free-png.png',
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            leftSide ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            'Cheese',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 77, 0, 0),
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
            endIndent: leftSide ? 1 : 200,
            indent: leftSide ? 200 : 1,
          ),
          Row(
            mainAxisAlignment:
                leftSide ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Text(
                '1',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 77, 0, 0),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Sauce + ',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                '2',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 77, 0, 0),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Cheese',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            '\$ 7.95',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 77, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
