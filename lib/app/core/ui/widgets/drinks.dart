// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../modules/auth/cart/cart_page.dart';
import '../extensions/theme_extension.dart';

class Drinks extends StatelessWidget {
  bool? addDrink;
  List drinks;

  Drinks({
    Key? key,
    this.addDrink = true,
    required this.drinks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeDevice = MediaQuery.of(context).size;
    return Container(
      width: sizeDevice.width,
      height: 210.h,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => Divider(height: 20.h),
        itemCount: drinks.length,
        itemBuilder: ((context, index) {
          if (!addDrink! && drinks[index].countItem > 0) {
            return GestureDetector(
              onTap: () {
                if (addDrink!) {
                  showModalBottomSheet<void>(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return ItemModal(index: index);
                    },
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                width: 135.w,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: .5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF7F8FA),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5.h),
                      width: 90.w,
                      height: 110.h,
                      child: Stack(
                        children: [
                          Center(
                            child: Image.network(
                              (addDrink! ? drinks[index].drink : drinks[index])
                                  .image,
                            ),
                          ),
                          Visibility(
                            visible: drinks[index].countItem >= 1,
                            child: Container(
                              alignment: Alignment.center,
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: context.primaryColorLight,
                                  width: .5,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                color: context.primaryColorDark,
                              ),
                              child: Text(
                                '${drinks[index].countItem}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        (addDrink! ? drinks[index].drink : drinks[index]).name,
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 5),
                      width: sizeDevice.width * .7,
                      child: Text(
                        '\$ ${(addDrink! ? drinks[index].drink : drinks[index]).price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (addDrink!) {
            return GestureDetector(
              onTap: () {
                if (addDrink!) {
                  showModalBottomSheet<void>(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return ItemModal(index: index);
                    },
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                width: 135.w,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: .5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF7F8FA),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5.h),
                      width: 90.w,
                      height: 110.h,
                      child: Stack(
                        children: [
                          Center(
                            child: Image.network(
                              (addDrink! ? drinks[index].drink : drinks[index])
                                  .image,
                            ),
                          ),
                          Observer(
                            builder: (_) {
                              return Visibility(
                                visible: drinks[index].countItem >= 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 20.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.primaryColorLight,
                                      width: .5,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    color: context.primaryColorDark,
                                  ),
                                  child: Text(
                                    '${drinks[index].countItem}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        (addDrink! ? drinks[index].drink : drinks[index]).name,
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 5),
                      width: sizeDevice.width * .7,
                      child: Text(
                        '\$ ${(addDrink! ? drinks[index].drink : drinks[index]).price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
