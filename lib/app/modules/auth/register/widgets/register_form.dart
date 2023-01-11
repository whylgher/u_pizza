part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  static final emailEC = TextEditingController();
  static final passwordEC = TextEditingController();
  static final nameEC = TextEditingController();
  static final phoneEC = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  static final controller = Modular.get<RegisterController>();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _RegisterForm.formKey,
        child: Container(
          margin: EdgeInsets.only(top: 100.h),
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: 100.h,
          ),
          height: sizeDevice.height < 850 ? 400.h : 400.h,
          child: PageView(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            controller: RegisterPage.controller,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: sizeDevice.width * .7,
                    height: sizeDevice.width * .15,
                    child: const Text(
                      'Your name is important, we need it so that we can identify you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  UPizzaTextFormField(
                    label: 'name',
                    controller: _RegisterForm.nameEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('required name'),
                      Validatorless.min(3, 'invalid name'),
                    ]),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: sizeDevice.width * .7,
                    height: sizeDevice.width * .2,
                    child: const Text(
                      'And your phone, we will let you know about your order and also for our delivery agent communicate with you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  UPizzaTextFormField(
                    label: 'phone',
                    isNumber: true,
                    controller: _RegisterForm.phoneEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('required phone'),
                      Validatorless.min(9, 'invalid number'),
                      Validatorless.number('invalid number'),
                    ]),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: sizeDevice.width * .7,
                    height: sizeDevice.width * .15,
                    child: const Text(
                      "For you to access, we need your email, don't worry, we won't send you spam.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  UPizzaTextFormField(
                    label: 'email',
                    controller: _RegisterForm.emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('required email'),
                      Validatorless.email('invalid email'),
                    ]),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: sizeDevice.width * .7,
                    height: sizeDevice.width * .15,
                    child: const Text(
                      'Now the most important thing, enter a strong and secure password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  UPizzaTextFormField(
                    label: 'Senha',
                    obscureText: true,
                    controller: _RegisterForm.passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('required password'),
                      Validatorless.min(
                          6, 'password must be greater than 6 digits'),
                    ]),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  UPizzaTextFormField(
                    label: 'Confirmar Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('required password'),
                      Validatorless.min(
                          6, 'password must be greater than 6 digits'),
                      Validatorless.compare(
                          _RegisterForm.passwordEC, 'different passwords'),
                    ]),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
