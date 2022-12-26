part of '../make_pizza_page.dart';

class ProteinPizzaView extends StatelessWidget {
  final dynamic sizeDevice;

  const ProteinPizzaView({
    Key? key,
    required this.sizeDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Now in the third step, choose a protein',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Stack(
            children: [
              SizedBox(
                width: sizeDevice.width * .65,
                child: const Image(
                  image: NetworkImage(
                      'https://quemservicos.com.br/u_pizzas/make_pizza/droast_pizza.png'),
                ),
              ),
              SizedBox(
                width: sizeDevice.width * .65,
                child: const Image(
                  image: NetworkImage(
                    'https://quemservicos.com.br/u_pizzas/make_pizza/pepperoni.png',
                    scale: 0.75,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          const TitleAddItems(
            title: 'Choose your protein',
            subTitle: 'Select 1',
            required: true,
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
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
                    const Text(
                      'Pepperoni',
                      style: TextStyle(
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
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
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
                    const Text(
                      'Pepperoni',
                      style: TextStyle(
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
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
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
                    const Text(
                      'Pepperoni',
                      style: TextStyle(
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
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
