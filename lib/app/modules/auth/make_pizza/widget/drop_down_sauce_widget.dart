part of '../make_pizza_page.dart';

class DropDownSauceWidget extends StatelessWidget {
  final controller = Modular.get<MakePizzaController>();

  DropDownSauceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String dropdownValue = controller.sauces.first.name;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
          width: .5,
        ),
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF7F8FA),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: DropdownButton<String>(
        isExpanded: true,
        dropdownColor: const Color(0xFFF1F1F1),
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_drop_down_outlined,
          size: 30.h,
        ),
        onChanged: (String? value) {
          dropdownValue = value!;
        },
        items: controller.sauces.map<DropdownMenuItem<String>>(
          (value) {
            return DropdownMenuItem<String>(
              alignment: AlignmentDirectional.center,
              value: value.name,
              child: Text(
                value.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
