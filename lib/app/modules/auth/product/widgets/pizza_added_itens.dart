part of '../product_page.dart';

class PizzaAddedItens extends StatelessWidget {
  final String label;
  final String? price;
  final bool? item;
  final int? countInt;
  const PizzaAddedItens({
    Key? key,
    required this.label,
    this.price = '',
    this.item = true,
    this.countInt = 1,
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
                            width: 2,
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
                      Container(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '$countInt',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
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

class TitleAddItems extends StatelessWidget {
  final String title;
  final bool required;
  const TitleAddItems({
    Key? key,
    required this.title,
    required this.required,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: context.primaryColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
            child: Text(
              required ? 'REQUIRED' : 'OPTIONAL',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
