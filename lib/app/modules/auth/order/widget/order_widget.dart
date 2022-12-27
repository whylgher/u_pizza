part of '../order_page.dart';

class OrderWidget extends StatelessWidget {
  final String label;
  final dynamic sizeDevide;
  final Map<String, Color> order;

  const OrderWidget({
    Key? key,
    required this.label,
    required this.sizeDevide,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String labelProgress = order.keys.toString();
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: sizeDevide.width * .9,
            height: sizeDevide.height * .2,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: sizeDevide.height * .12,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: order[order.keys.first],
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                          '${labelProgress.replaceAll('(', '').replaceAll(')', '')} Order'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
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
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Ordered',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Row(
                              children: [
                                UPizzaIcons.separator(),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                  'Slice Pizza',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: UPizzaIcons.pizza(height: sizeDevide.height * .12),
                    ),
                  ],
                ),
                const Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                ),
                GestureDetector(
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'SEE ORDER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: context.primaryColorDark,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderProgressWidget extends StatelessWidget {
  final String label;
  final dynamic sizeDevide;
  final OrderEnum progress;

  const OrderProgressWidget({
    Key? key,
    required this.label,
    required this.sizeDevide,
    required this.progress,
  }) : super(key: key);

  Map<String, Color> progressOrder(OrderEnum progress) {
    switch (progress) {
      case OrderEnum.completed:
        return {'Completed': Colors.green};
      case OrderEnum.canceled:
        return {'Canceled': Colors.red};
      case OrderEnum.waiting:
        return {'Waiting': Colors.blueAccent};
    }
  }

  @override
  Widget build(BuildContext context) {
    final order = progressOrder(progress);
    return OrderWidget(label: label, sizeDevide: sizeDevide, order: order);
  }
}
