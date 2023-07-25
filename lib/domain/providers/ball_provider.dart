import 'package:flutter/cupertino.dart';
import 'package:surf_practice_magic_ball/domain/api/magic_ball_api.dart';
import 'package:surf_practice_magic_ball/domain/models/ball_model.dart';

class BallProvider extends ChangeNotifier {
 BallModel ball = const BallModel(answer: '');
  
  
  Future<void> getAnswer(Duration duration) async {
    
    ball = ball.copyWith(isWaiting: true);
    notifyListeners();
    
    await Future.delayed(duration);
    
    final newAnswer = await MagicBallApi.getData();
    ball = BallModel.fromJson(newAnswer ?? {});
    
    notifyListeners();
  }
}