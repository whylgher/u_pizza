part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          UPizzaTextFormField(
            label: 'name',
            focused: false,
          ),
          SizedBox(
            height: 20.h,
          ),
          UPizzaTextFormField(label: 'phone'),
          SizedBox(
            height: 20.h,
          ),
          UPizzaTextFormField(label: 'email'),
          SizedBox(
            height: 20.h,
          ),
          UPizzaTextFormField(
            label: 'Senha',
            obscureText: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          UPizzaTextFormField(
            label: 'Confirmar Senha',
            obscureText: true,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
