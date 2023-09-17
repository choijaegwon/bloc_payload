// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChagneThemeEvent extends ThemeEvent {
  final int randInt;
  ChagneThemeEvent({
    required this.randInt,
  });

  @override
  String toString() => 'ChagneThemeEven(randInt: $randInt)';

  @override
  List<Object> get props => [randInt];
}
