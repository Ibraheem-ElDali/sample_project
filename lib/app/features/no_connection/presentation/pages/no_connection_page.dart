import 'package:flutter/material.dart';
import '../widgets/body_section.dart';

class NoInternetConnectionPage extends StatelessWidget {
  const NoInternetConnectionPage({Key? key, this.afterNetworkBackCallback})
      : super(key: key);

  final VoidCallback? afterNetworkBackCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySection(afterNetworkBackCallback!),
    );
  }
}
