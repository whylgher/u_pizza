part of '../../home_page.dart';

class AppBarWidget extends PreferredSize {
  final String textAddress;
  AppBarWidget({
    required this.textAddress,
    super.key,
  }) : super(
          preferredSize: const Size.fromHeight(250),
          child: SizedBox(
            height: 140.h,
            child: Stack(
              children: [
                Container(
                  height: 130.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFCF3C29),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/images/bg.png"),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.0.w, left: 20.w),
                        child: Row(
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                UPizzaIcons.location(height: 25.h),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  textAddress,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.0.w, right: 25.w),
                        child: GestureDetector(
                          onTap: () {
                            Modular.to.navigate('/auth/menu');
                          },
                          child: UPizzaIcons.menuOpen(height: 25.h),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0.0, 1.3),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 28, left: 28),
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      elevation: 3.0,
                      shadowColor: Colors.grey,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'What are you craving?',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.fromLTRB(
                            20.0,
                            10.0,
                            20.0,
                            0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
}
