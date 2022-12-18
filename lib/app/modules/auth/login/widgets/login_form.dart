part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          UPizzaTextFormField(
            label: 'e-mail',
          ),
          SizedBox(
            height: 20.h,
          ),
          UPizzaTextFormField(
            label: 'password',
            obscureText: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          UPizzaDefaultButton(
            label: 'LOGIN',
            borderRadius: 50,
            labelColor: Colors.black,
            fontWeight: FontWeight.bold,
            height: 70.h,
            onPressed: () {
              Modular.to.navigate('/home');
            },
          ),
        ],
      ),
    );
  }
}
