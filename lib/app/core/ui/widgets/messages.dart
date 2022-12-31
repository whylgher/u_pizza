import 'package:asuka/asuka.dart' as asuka;

class Messages {
  Messages._();

  static void alert(String message) {
    asuka.AsukaSnackbar.alert(message).show();
  }

  static void info(String message) {
    asuka.AsukaSnackbar.info(message).show();
  }
}
