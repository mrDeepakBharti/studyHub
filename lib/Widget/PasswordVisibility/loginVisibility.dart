import 'package:get/get.dart';

class PasswordVisibility extends GetxController {
  RxBool obscureText = false.obs;
  RxBool confirmPassword = false.obs;
  void toggle() {
    obscureText.value = !obscureText.value;
  }

  void confirmPasswordToggle() {
    confirmPassword.value = !confirmPassword.value;
  }
}
