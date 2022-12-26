part of '../make_pizza_page.dart';

const List<String> list = <String>[
  'none',
  'Sauce',
  'Sauce1',
  'Sauce2',
  'Sauce3',
];

class DropDownSauceWidget extends StatefulWidget {
  const DropDownSauceWidget({super.key});

  @override
  State<DropDownSauceWidget> createState() => _DropDownSauceWidgetState();
}

class _DropDownSauceWidgetState extends State<DropDownSauceWidget> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
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
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            alignment: AlignmentDirectional.center,
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
