part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  const _LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        RoundedButtonWithIcon(
          onTap: () {},
          width: .38.sw,
          color: const Color(0xFFE15031),
          icon: Icons.mail,
          label: 'Google',
        ),
        RoundedButtonWithIcon(
          onTap: () {
            Modular.to.navigate('/auth/register');
          },
          width: .38.sw,
          color: context.primaryColorDark,
          icon: Icons.mail,
          label: 'Register',
        ),
      ],
    );
  }
}
