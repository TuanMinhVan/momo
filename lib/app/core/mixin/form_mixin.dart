import 'package:get/get.dart';

import '../styles/style.dart';

mixin FormMixin implements GetxController {
  final formKey = GlobalKey<FormState>();
  final _loading = false.obs;
  set loading(bool val) => _loading(val);
  bool get loading => _loading.value;
  bool get isValidate => formKey.currentState?.validate() ?? false;
  void submitForm() {
    _loading.value = true;
  }
}
