import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/domain/providers/ball_provider.dart';
import 'package:surf_practice_magic_ball/domain/router/app_router.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BallProvider>(create: (_) => BallProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        onGenerateRoute: AppRouter.generate,
      ),
    );
  }
}
