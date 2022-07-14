import 'result_model.dart';

class WorkoutsModel {
  WorkoutsModel({
    this.result,
    this.time,
    this.errorMsg,
  });

  factory WorkoutsModel.fromJson(Map<String, dynamic> map) {
    return WorkoutsModel(
      result: List<ResultModel>.from(
        map['result'].map((e) => ResultModel.fromJson(e)),
      ),
      time: map['timeGenerated'] ?? 'UnKnown',
      errorMsg: map['errorMessage'] ?? 'UnKnown',
    );
  }

  final List<ResultModel>? result;
  final String? time;
  final String? errorMsg;
}
