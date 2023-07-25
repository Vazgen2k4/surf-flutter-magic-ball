import 'package:equatable/equatable.dart';

class BallModel extends Equatable {
  final String? answer;

  final bool haveError;
  final bool isWaiting;

  const BallModel({
    this.answer,
    this.isWaiting = false,
  }) : haveError = answer == null;

  factory BallModel.fromJson(Map<String, dynamic> json) {
    final answer = json['reading'];

    return BallModel(answer: answer);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['reading'] = answer;

    return data;
  }

  BallModel copyWith({
    String? answer,
    bool? isWaiting,
  }) {
    return BallModel(
      answer: answer ?? this.answer,
      isWaiting: isWaiting ?? this.isWaiting,
    );
  }

  @override
  List<Object?> get props => [answer];
}
