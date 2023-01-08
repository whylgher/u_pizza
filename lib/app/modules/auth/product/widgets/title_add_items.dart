part of '../product_page.dart';

class TitleAddItems extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool? required;
  const TitleAddItems({
    Key? key,
    required this.title,
    this.subTitle,
    this.required = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeDevide = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: sizeDevide.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  subTitle ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: context.primaryColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
            child: Text(
              required! ? 'REQUIRED' : 'OPTIONAL',
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
