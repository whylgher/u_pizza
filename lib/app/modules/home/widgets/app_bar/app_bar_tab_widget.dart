part of '../../home_page.dart';

class AppBarTabWidget extends PreferredSize {
  AppBarTabWidget({
    super.key,
  }) : super(
          preferredSize: const Size.fromHeight(250),
          child: DefaultTabController(
            length: 5,
            initialIndex: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: TabBar(
                        overlayColor: MaterialStateProperty.all(Colors.amber),
                        indicatorColor: const Color(0xFFF8AF36),
                        isScrollable: true,
                        tabs: const [
                          Tab(
                            text: "People’s Choice",
                          ),
                          Tab(
                            text: "U Pizza",
                          ),
                          Tab(
                            text: "U Drinks",
                          ),
                          Tab(
                            text: "Salad",
                          ),
                          Tab(
                            text: "Combo",
                          ),
                        ],
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicator: RectangularIndicator(
                          verticalPadding: 5,
                          color: const Color(0xFFF8AF36),
                          bottomLeftRadius: 100,
                          bottomRightRadius: 100,
                          topLeftRadius: 100,
                          topRightRadius: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
}
