import 'package:flutter/cupertino.dart';
import 'package:surf_practice_magic_ball/domain/api/magic_ball_api.dart';
import 'package:surf_practice_magic_ball/domain/models/ball_model.dart';

class BallProvider extends ChangeNotifier {
 BallModel ball = const BallModel();
  
  
  Future<void> getAnswer() async {
    final newAnswer =  await MagicBallApi.getData();
    
    ball = BallModel.fromJson(newAnswer ?? {});
    
    notifyListeners();
  }
}