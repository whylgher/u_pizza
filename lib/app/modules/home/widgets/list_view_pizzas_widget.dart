part of '../home_page.dart';

final Map<String, dynamic> entriess = {
  'pizzas1': {
    'id': '1',
    'name': 'Vegetarian',
    'subtitle':
        '18” XLarge | Olives, onion, pepper, cheese, tomato puree18” XLarge | Olives, onion, pepper, cheese, tomato puree',
    'url_img': 'https://quemservicos.com.br/cbjr/imgs/pizza1.png',
    'size_price': {
      'regular': {
        'standart': 'FREE',
        'price': '12.95',
      },
      'double': '25.47',
      'large': '28.79',
      'x_large': '32.99',
    },
    'sale': 'regular',
  },
  'pizzas2': {
    'id': '2',
    'name': 'Magherita',
    'subtitle': '18” XLarge | Cheese, tomato puree, pepperoni, Basil',
    'url_img': 'https://quemservicos.com.br/cbjr/imgs/pizza2.png',
    'size_price': {
      'regular': {
        'standart': 'FREE',
        'price': '21.47',
      },
      'double': '28.15',
      'large': '30.33',
      'x_large': '34.45',
    },
  },
  'pizzas3': {
    'id': '4',
    'name': 'Classic Supreme',
    'subtitle':
        '18” XLarge | Tomato, onion, basil, cheese, pepperoni, mushroom',
    'url_img': 'https://quemservicos.com.br/cbjr/imgs/pizza3.png',
    'size_price': {
      'regular': {
        'standart': 'FREE',
        'price': '12.11',
      },
      'double': '23.09',
      'large': '25.87',
      'x_large': '30.33',
    },
  },
  'pizzas4': {
    'id': '4',
    'name': 'Garden Supreme',
    'subtitle': '15” Large | Olives, onion, pepper, mushroom, cheese',
    'url_img': 'https://quemservicos.com.br/cbjr/imgs/pizza4.png',
    'size_price': {
      'regular': {
        'standart': 'FREE',
        'price': '16.11',
      },
      'double': '27.17',
      'large': '31.23',
      'x_large': '36.54',
    },
  },
  'pizzas5': {
    'id': '5',
    'name': 'Vegetarian',
    'subtitle':
        '18” XLarge | Olives, onion, pepper, cheese, tomato puree18” XLarge | Olives, onion, pepper, cheese, tomato puree',
    'url_img': 'https://quemservicos.com.br/cbjr/imgs/pizza1.png',
    'size_price': {
      'regular': {
        'standart': 'FREE',
        'price': '12.95',
      },
      'double': '25.47',
      'large': '28.79',
      'x_large': '32.99',
    },
  },
  'pizzas6': {
    'id': '6',
    'name': 'Magherita',
    'subtitle': '18” XLarge | Cheese, tomato puree, pepperoni, Basil',
    'url_img': 'https://quemservicos.com.br/cbjr/imgs/pizza2.png',
    'size_price': {
      'regular': {
        'standart': 'FREE',
        'price': '21.47',
      },
      'double': '28.15',
      'large': '30.33',
      'x_large': '34.45',
    },
  },
  'pizzas7': {
    'id': '7',
    'name': 'Classic Supreme',
    'subtitle':
        '18” XLarge | Tomato, onion, basil, cheese, pepperoni, mushroom',
    'url_img': 'https://quemservicos.com.br/cbjr/imgs/pizza3.png',
    'size_price': {
      'regular': {
        'standart': 'FREE',
        'price': '12,11',
      },
      'double': '23,09',
      'large': '25,87',
      'x_large': '30,33',
    },
  },
  'pizzas8': {
    'id': '8',
    'name': 'Garden Supreme',
    'subtitle': '15” Large | Olives, onion, pepper, mushroom, cheese',
    'url_img': 'https://quemservicos.com.br/cbjr/imgs/pizza4.png',
    'size_price': {
      'regular': {
        'standart': 'FREE',
        'price': '16.11',
      },
      'double': '27.17',
      'large': '31.23',
      'x_large': '36.54',
    },
  },
};

dynamic c = entriess.values.toList();
dynamic d = entriess.keys.toList();

class ListViewPizzasWidget extends PreferredSize {
  // ignore: prefer_typing_uninitialized_variables
  static var pizza;
  ListViewPizzasWidget({super.key})
      : super(
          preferredSize: const Size.fromHeight(0),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: entriess.keys.length,
            itemBuilder: (BuildContext context, int index) {
              final sizeDevice = MediaQuery.of(context).size;

              return GestureDetector(
                onTap: () {
                  pizza = PizzasModel.fromMap(c[index]);
                  // ignore: avoid_print
                  print('\npizza');
                  // ignore: avoid_print
                  print(pizza);
                  // ignore: avoid_print
                  print('\npizza');
                  Modular.to.navigate('/auth/product_page');
                },
                child: Container(
                  width: sizeDevice.width * .1,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        scale: .5,
                        alignment: Alignment(-1.2.w, 0.h),
                        image: NetworkImage(c[index]['url_img']),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 95),
                          child: Text(
                            '${c[index]['name']}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5, right: 10),
                          margin: const EdgeInsets.only(left: 105),
                          width: sizeDevice.width * .6,
                          child: Text(
                            '${c[index]['subtitle']}',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 90.w, top: 5.h),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: context.primaryColor,
                                ),
                                padding: const EdgeInsets.all(5),
                                child: const Text(
                                  'Standart',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: context.primaryColorDark,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: const Text(
                                'SALE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, right: 15),
                                child: Text(
                                  'U\$${c[index]['size_price']['regular']['price']}',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        );
}
