import 'package:equatable/equatable.dart';

class BallModel extends Equatable {
  final String? answer;
  const BallModel({this.answer});

  factory BallModel.fromJson(Map<String, dynamic> json) {
    final answer = json['reading'];

    return BallModel(answer: answer);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['reading'] = answer;

    return data;
  }

  @override
  List<Object?> get props => [answer];
}
