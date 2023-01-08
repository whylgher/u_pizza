// ignore_for_file: prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

part of '../home_page.dart';

final controller = Modular.get<HomeController>();
final controllerPizza = Modular.get<ProductController>();

class ListViewPizzasWidget extends PreferredSize {
  ListViewPizzasWidget({super.key})
      : super(
          preferredSize: Size.fromHeight(110.h),
          child: Observer(
            builder: (_) {
              return ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: controller.pizzasList.length,
                itemBuilder: (BuildContext context, int index) {
                  final sizeDevice = MediaQuery.of(context).size;

                  return GestureDetector(
                    onTap: () async {
                      final pizzId = controller.pizzasList[index];
                      //  var pizza = PizzasModel.fromMap(pizzId);
                      await controllerPizza.getPizza(pizzId['pizza_id']);
                      Future.delayed(const Duration(seconds: 1)).then(
                        (value) async {
                          controllerPizza.price =
                              controllerPizza.pizza['prices'][0]['regular'];
                          // Loader.hide();
                          controllerPizza.set();
                          controllerPizza.sizePizzaRegular();

                          Modular.to.navigate('/auth/product_page');
                        },
                      );
                    },
                    child: Container(
                      constraints: BoxConstraints(minHeight: 110.h),
                      width: sizeDevice.width * .1,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            alignment: Alignment(-1.2.w, 0.h),
                            image: NetworkImage(
                                controller.pizzasList[index]['image']),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 95),
                                child: Text(
                                  '${controller.pizzasList[index]['name']}',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 5, right: 10),
                                margin: const EdgeInsets.only(left: 105),
                                width: sizeDevice.width * .6,
                                child: Text(
                                  '${controller.pizzasList[index]['description']}',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Padding(
                                // padding: EdgeInsets.only(left: 90.w, top: 5.h),
                                // child: Container(
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(5),
                                //     color: context.primaryColor,
                                //   ),
                                //   padding: const EdgeInsets.all(5),
                                //   child: Text(
                                //     '${HomePage.pizzas[index]['sale'].toUpperCase()}',
                                //     style: const TextStyle(
                                //       color: Colors.black,
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 12,
                                //     ),
                                //   ),
                                // ),
                                // ),
                                // Container(
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(5),
                                //   color: context.primaryColorDark,
                                // ),
                                // padding: const EdgeInsets.all(5),
                                // child: const Text(
                                //   'SALE',
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 12,
                                //   ),
                                // ),
                                // ),
                                SizedBox(
                                  width: 50.w,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 15),
                                  child: Text(
                                    'U\$ ${controller.pizzasList[index]['regular']}',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
}
