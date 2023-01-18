part of '../order_page.dart';

class OrderWidget extends StatelessWidget {
  final String label;
  final OrderModel orderModel;
  final Size sizeDevice;
  final Map<String, Color> status;

  const OrderWidget({
    Key? key,
    required this.label,
    required this.orderModel,
    required this.sizeDevice,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            width: sizeDevice.width * .9,
            height: sizeDevice.height * .2,
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
                      height: sizeDevice.height * .15,
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
                                        color: status[status.keys.first],
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text('${status.keys.first} Order'),
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
                                  orderModel.order.length.toString(),
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
                          SizedBox(
                            height: sizeDevice.height * .08,
                            width: 100,
                            child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (_, __) =>
                                  const Divider(height: 0),
                              itemCount: orderModel.order.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Row(
                                    children: [
                                      UPizzaIcons.separator(),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(
                                        orderModel.order[index].name,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: UPizzaIcons.pizza(height: sizeDevice.height * .14),
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
                  onTap: () {
                    Modular.to.navigate('/auth/order/order-view');
                  },
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
