import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/styles/app_icons.dart';
import '../../../../common/styles/app_labels.dart';
import '../../../../common/utils/extensions.dart';
import '../../../widgets/custom_field.dart';
import '../providers/login_provider.dart';

class FieldsSection extends StatelessWidget {
  const FieldsSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<LoginProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Column(
        children: [
          CustomField(
            controller: _provider.userNameController,
            prefixIcon: AppIcons.user,
            hintText: AppLabel.userNameFieldHint,
            validator: (String? val) => _provider.checkUserNameValidation(val!),
          ),
          SizedBox(height: 24.h),
          CustomField(
            controller: _provider.passwordController,
            prefixIcon: AppIcons.lock,
            hintText: AppLabel.passwordFieldHint,
            validator: (String? val) => _provider.passwordFieldValidation(val!),
          ),
        ],
      ),
    );
  }
}
