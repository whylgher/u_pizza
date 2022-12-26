part of '../make_pizza_page.dart';

class ItemSelectWidget extends StatelessWidget {
  final String label;

  const ItemSelectWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.primaryColorDark,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: context.primaryColorDark,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  UPizzaIcons.cheeseLeft(),
                  const SizedBox(
                    width: 10,
                  ),
                  UPizzaIcons.cheeseFull(),
                  const SizedBox(
                    width: 10,
                  ),
                  UPizzaIcons.cheeseRight(),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          const Text(
            'FREE',
            style: TextStyle(
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}

class VegetableAndOthersWidget extends StatelessWidget {
  final String label;
  final Size sizeDevice;

  const VegetableAndOthersWidget({
    Key? key,
    required this.label,
    required this.sizeDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeDevice.width * .35,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.primaryColorDark,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
