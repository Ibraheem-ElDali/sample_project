import 'result_model.dart';

class ExerciseDetailsModel {
  ExerciseDetailsModel({
    this.result,
    this.time,
    this.errorMsg,
  });

  factory ExerciseDetailsModel.fromJson(Map<String, dynamic> map) {
    return ExerciseDetailsModel(
      result: ResultModel.fromJson(map['result']),
      time: map['timeGenerated'] ?? 'UnKnown',
      errorMsg: map['errorMessage'] ?? 'UnKnown',
    );
  }

  final ResultModel? result;
  final String? time;
  final String? errorMsg;
}
