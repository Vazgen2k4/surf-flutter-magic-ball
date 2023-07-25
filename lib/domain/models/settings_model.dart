import 'package:equatable/equatable.dart';

class SettingsModel extends Equatable {
  final bool themeIsDark;
  
  const SettingsModel({this.themeIsDark = true, });

  @override
  List<Object?> get props => throw UnimplementedError();
}
