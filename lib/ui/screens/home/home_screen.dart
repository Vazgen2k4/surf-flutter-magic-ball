import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/domain/providers/ball_provider.dart';
import 'package:surf_practice_magic_ball/resources/resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 80, 24, 87),
            Color(0xff000002),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MagicBall(),
              const SizedBox(height: 100),
              SvgPicture.asset(
                AppIcons.shadow,
              ),
              const SizedBox(height: 50),
              const SizedBox(
                width: 175,
                child: Text(
                  'Нажмите на шар или потрясите телефон',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff727272),
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MagicBall extends StatefulWidget {
  const MagicBall({
    super.key,
  });

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> with TickerProviderStateMixin {
  late AnimationController _ballController;
  final double maxOffsetValue = 50;
  final Curve curve = Curves.bounceOut;
  ShakeDetector? detecror;

  @override
  void initState() {
    super.initState();

    _ballController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )
      ..forward()
      ..addListener(
        () {
          if (_ballController.isCompleted) {
            _ballController.reverse();
          } else if (!_ballController.isAnimating) {
            _ballController.forward();
          }
        },
      );
  }

  double toAnimateOffet(double value) {
    return (curve.transform(value.abs()) * maxOffsetValue);
  }

  @override
  void dispose() {
    super.dispose();

    if (detecror != null) {
      detecror!.stopListening();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ballProvider = context.read<BallProvider>();
    detecror = ShakeDetector.autoStart(onPhoneShake: ballProvider.getAnswer);
    detecror?.startListening();


    return GestureDetector(
      onTap: () async => await ballProvider.getAnswer(),
      child: Center(
        child: AnimatedBuilder(
          animation: _ballController,
          child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(AppImage.ball),
            radius: 160,
            child: BallContent(),
          ),
          builder: (context, child) {
            final offset = Offset(0, toAnimateOffet(_ballController.value));

            return Transform.translate(
              offset: offset,
              child: child,
            );
          },
        ),
      ),
    );
  }
}

class BallContent extends StatelessWidget {
  const BallContent({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<BallProvider>().ball;

    return SizedBox(
      width: 275,
      child: Text(
        model.answer ?? "",
        textAlign: TextAlign.center,
        style:
            const TextStyle(fontSize: 32, color: Colors.white, height: 32 / 36),
      ),
    );
  }
}
