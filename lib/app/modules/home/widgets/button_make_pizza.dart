part of '../home_page.dart';

class ButtonMakePizza extends StatelessWidget {
  const ButtonMakePizza({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: ElevatedButton(
        onPressed: () {},
        // ignore: sort_child_properties_last
        child: SizedBox(
          height: 55.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Transform.rotate(
                  angle: 180 * math.pi / 180, child: UPizzaIcons.pizzaPizza()),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'MAKE ',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'U PIZZA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' NOW',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              UPizzaIcons.pizzaPizza(),
            ],
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
