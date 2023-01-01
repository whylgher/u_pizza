part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _controller = Modular.get<LoginController>();

  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UPizzaTextFormField(
            controller: _loginEC,
            label: 'e-mail',
            validator: Validatorless.multiple([
              Validatorless.required('required login.'),
              Validatorless.email('invalid e-mail.'),
            ]),
          ),
          SizedBox(
            height: 20.h,
          ),
          UPizzaTextFormField(
            controller: _passwordEC,
            label: 'password',
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required('required password'),
              Validatorless.min(6, 'password must be greater than 6 digits'),
            ]),
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
            onPressed: () async {
              final formValid = _formKey.currentState?.validate() ?? false;
              if (!formValid) {
                // await _controller.login(_loginEC.text, _passwordEC.text);
                await _controller.login('whylgher@gmail.com', '123123');
              }
            },
          ),
        ],
      ),
    );
  }
}
