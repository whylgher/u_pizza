part of '../cart_page.dart';

class ItemModal extends StatelessWidget {
  final int index;

  const ItemModal({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 325.h,
      child: Observer(builder: (_) {
        final controller = Modular.get<CartController>();
        final drink = controller.drinks[index];
        return Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(50),
                height: 175.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.addItem(index);
                          },
                          child: Container(
                            height: 35.h,
                            width: 35.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF49134),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            '${drink.countItem}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.removeItem(index);
                          },
                          child: Container(
                            height: 35.h,
                            width: 35.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF49134),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          drink.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                        Text(
                          drink.ml >= 1000 ? '${drink.ml}L' : '${drink.ml}ml',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: SizedBox(
                height: 200.h,
                child: Image.network(drink.image),
              ),
            ),
          ],
        );
      }),
    );
  }
}
