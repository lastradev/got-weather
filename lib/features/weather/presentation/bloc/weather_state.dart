part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class Empty extends WeatherState {}

class Loading extends WeatherState {}

class Loaded extends WeatherState {
  final Weather weather;
  final GOTWeather gotWeather;

  const Loaded({
    required this.weather,
    required this.gotWeather,
  });
}

class Error extends WeatherState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
