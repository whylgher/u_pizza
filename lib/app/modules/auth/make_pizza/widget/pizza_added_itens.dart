part of '../make_pizza_page.dart';

class PizzaAddedItens extends StatelessWidget {
  final String label;
  final int? index;
  final String? price;
  final bool? item;
  final bool? selected;
  final int? countInt;

  const PizzaAddedItens({
    Key? key,
    required this.label,
    this.index = 0,
    this.price = '',
    this.item = true,
    this.selected = false,
    this.countInt = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            Visibility(
              visible: item!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.primaryColorDark,
                            width: selected! ? 5 : 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                  Text(
                    price!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !item!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF49134),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF49134),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                  Text(
                    price!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
