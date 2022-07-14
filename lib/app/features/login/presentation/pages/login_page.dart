import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../common/utils/extensions.dart';
import '../../../widgets/custom_loading.dart';
import '../providers/login_provider.dart';
import '../widgets/button_section.dart';
import '../widgets/fields_section.dart';
import '../widgets/title_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer(
        builder: (_, __, ___) => ModalProgressHUD(
          inAsyncCall: _provider.isLoading,
         // child:  const CustomLoading(),
          progressIndicator: const CustomLoading(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 40.h,
            ),
            child: Column(
              children: const [
                TitleSection(),
                FieldsSection(),
                Spacer(),
                ButtonSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
