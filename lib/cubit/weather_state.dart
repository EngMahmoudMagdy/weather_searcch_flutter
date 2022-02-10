part of 'weather_cubit.dart';


abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}
class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

//<editor-fold desc="Data Methods">

  const WeatherLoaded({
    required this.weather,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherLoaded &&
          runtimeType == other.runtimeType &&
          weather == other.weather);

  @override
  int get hashCode => weather.hashCode;

  @override
  String toString() {
    return 'WeatherLoaded{' + ' weather: $weather,' + '}';
  }

  WeatherLoaded copyWith({
    Weather? weather,
  }) {
    return WeatherLoaded(
      weather: weather ?? this.weather,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weather': this.weather,
    };
  }

  factory WeatherLoaded.fromMap(Map<String, dynamic> map) {
    return WeatherLoaded(
      weather: map['weather'] as Weather,
    );
  }

//</editor-fold>
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
