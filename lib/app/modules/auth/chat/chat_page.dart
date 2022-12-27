import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/widgets/app_bar_default_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarDefaultWidget(
        label: 'Chat',
        action: () {
          Modular.to.navigate('/auth/menu');
        },
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        width: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    radius: 30.w,
                    child: CircleAvatar(
                      backgroundImage: const NetworkImage(
                        "https://scontent.fopo4-1.fna.fbcdn.net/v/t1.6435-9/75472695_2628515587229815_8525484424425373696_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=84a396&_nc_eui2=AeEKrO1q6zwsGN9-5r7AifcoNcNVzVspcQg1w1XNWylxCAM9oKwexA3HUtMcwQPPbbJ4XQCJfvyeRzCKzUlQ0nOI&_nc_ohc=i_aMZWb1YqsAX_Xcpce&_nc_ht=scontent.fopo4-1.fna&oh=00_AfAcTSrYWUD-KtfuIAZSwjnIC8aMpnpEYhVH_K7N75FZVg&oe=63C17EA9",
                      ),
                      backgroundColor: Colors.grey[400],
                      radius: 28.w,
                      //Text
                    ),
                  ),
                  SizedBox(
                    width: sizeDevice.width * .7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: sizeDevice.width * .5,
                          height: 50.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'U Pizza - Order Nº 1211',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF746C6C),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Hello, I have a problem with my pizza',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF746C6C),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 20.w,
                          height: 20.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF5F4298),
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    radius: 30.w,
                    child: CircleAvatar(
                      backgroundImage: const NetworkImage(
                        "https://scontent.fopo4-1.fna.fbcdn.net/v/t1.6435-9/75472695_2628515587229815_8525484424425373696_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=84a396&_nc_eui2=AeEKrO1q6zwsGN9-5r7AifcoNcNVzVspcQg1w1XNWylxCAM9oKwexA3HUtMcwQPPbbJ4XQCJfvyeRzCKzUlQ0nOI&_nc_ohc=i_aMZWb1YqsAX_Xcpce&_nc_ht=scontent.fopo4-1.fna&oh=00_AfAcTSrYWUD-KtfuIAZSwjnIC8aMpnpEYhVH_K7N75FZVg&oe=63C17EA9",
                      ),
                      backgroundColor: Colors.grey[400],
                      radius: 28.w,
                      //Text
                    ),
                  ),
                  SizedBox(
                    width: sizeDevice.width * .7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: sizeDevice.width * .5,
                          height: 50.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'U Pizza - Order Nº 1211',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF746C6C),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Hello, I have a problem with my pizza',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF746C6C),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 20.w,
                          height: 20.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF5F4298),
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
