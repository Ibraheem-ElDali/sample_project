import 'package:flutter/material.dart';
import '../../../../common/constants/locators.dart';
import '../../../../common/constants/route_paths.dart';
import '../../../../common/styles/app_labels.dart';
import '../../../../common/utils/validators.dart';
import '../../../widgets/custom_snack_bar.dart';
import '../../data/models/requests/login_request.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider(this._useCase);
  final LoginUseCase _useCase;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  checkUserNameValidation(String val) {
    if (val.isNotEmpty) {
      return Validators.instance.validateName(val);
    } else {
      return null;
    }
  }

  passwordFieldValidation(String val) {
    if (val.isNotEmpty) {
      return Validators.instance.validatePassword(val);
    } else {
      return null;
    }
  }

  Future<void> login() async {
    if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
      CustomSnackBar.show(AppLabel.fillAllFields);
    } else {
      isLoading = true;
      notifyListeners();
      final result = await _useCase.login(
        LoginRequest(
          userName: userNameController.text,
          password: passwordController.text,
          rememberMe: 'true',
          returnUrl: 'string',
        ),
      );
      result.fold(
        (l) => CustomSnackBar.show(l.message!),
        (r) =>
            Locators.navigation.navigateReplacementNamed(RoutePaths.workouts),
      );
      isLoading = false;
      notifyListeners();
    }
  }
}
