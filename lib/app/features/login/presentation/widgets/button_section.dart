import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/styles/app_labels.dart';
import '../../../widgets/custom_button.dart';
import '../providers/login_provider.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<LoginProvider>(context);
    return CustomButton(
      buttonLabel: AppLabel.login,
      onPressed: () => _provider.login(),
    );
  }
}
