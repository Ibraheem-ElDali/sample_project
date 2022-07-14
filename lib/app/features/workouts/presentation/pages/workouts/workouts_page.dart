import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../common/styles/app_labels.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_loading.dart';
import '../../../../widgets/no_connection_widget.dart';
import '../../provider/workouts_provider.dart';
import 'widgets/workouts_section.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<WorkoutsProvider>(context, listen: true);
    return Scaffold(
      appBar: CustomAppBar(
        title: AppBarData.title(AppLabel.workouts),
      ),
      body: (_provider.refreshWorkouts || !_provider.refreshWorkouts)
          ? FutureBuilder(
              future: _provider.getWorkouts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CustomLoading();
                } else {
                  if (snapshot.data is Right) {
                    return WorkoutsSection((snapshot.data as Right).value);
                  } else {
                    return NoConnectionWidget(
                      () => _provider.refreshWorkoutsFun(),
                    );
                  }
                }
              },
            )
          : Container(),
    );
  }
}
