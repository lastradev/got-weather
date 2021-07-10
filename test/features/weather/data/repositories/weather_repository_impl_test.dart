import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:got_weather/core/error/exception.dart';
import 'package:got_weather/core/error/failures.dart';
import 'package:got_weather/core/network/network_info.dart';
import 'package:got_weather/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:got_weather/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:got_weather/features/weather/data/models/weather_model.dart';
import 'package:got_weather/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:got_weather/features/weather/domain/entities/weather.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements WeatherRemoteDataSource {}

class MockLocalDataSource extends Mock implements WeatherLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late WeatherRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  void _runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void _runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = WeatherRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getWeatherFromCity', () {
    const tCityName = 'Tampico';
    const tWeatherModel = WeatherModel(
      cityName: tCityName,
      icon: '01d',
      temperature: 20,
    );
    const Weather tWeather = tWeatherModel;

    test('should check if the device is online', () {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getWeatherFromCity(tCityName))
          .thenAnswer((_) async => tWeatherModel);
      when(() => mockLocalDataSource.cacheCityName(tCityName))
          .thenAnswer((_) async {});

      // act
      repository.getWeatherFromCity(tCityName);
      // assert
      verify(() => mockNetworkInfo.isConnected);
    });

    _runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(() => mockRemoteDataSource.getWeatherFromCity(tCityName))
            .thenAnswer((_) async => tWeatherModel);
        when(() => mockLocalDataSource.cacheCityName(tCityName))
            .thenAnswer((_) async {});
        // act
        final result = await repository.getWeatherFromCity(tCityName);
        // assert
        verify(() => mockRemoteDataSource.getWeatherFromCity(tCityName));
        expect(result, equals(const Right(tWeather)));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(() => mockRemoteDataSource.getWeatherFromCity(tCityName))
            .thenAnswer((_) async => tWeatherModel);
        when(() => mockLocalDataSource.cacheCityName(tCityName))
            .thenAnswer((_) async {});
        // act
        await repository.getWeatherFromCity(tCityName);
        // assert
        verify(() => mockRemoteDataSource.getWeatherFromCity(tCityName));
        verify(() => mockLocalDataSource.cacheCityName(tCityName));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(() => mockRemoteDataSource.getWeatherFromCity(tCityName))
            .thenThrow(ServerException());
        // act
        final result = await repository.getWeatherFromCity(tCityName);
        // assert
        verify(() => mockRemoteDataSource.getWeatherFromCity(tCityName));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    _runTestsOffline(() {
      test('should return NetworkFailure when device is offline', () async {
        // act
        final result = await repository.getWeatherFromCity(tCityName);

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });

  group('getWeatherFromLocation', () {
    const tCityName = 'Tampico';
    const double tLatitude = 22;
    const double tLongitude = -97;
    const tWeatherModel = WeatherModel(
      cityName: tCityName,
      icon: '01d',
      temperature: 20,
    );
    const Weather tWeather = tWeatherModel;

    test('should check if the device is online', () {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getWeatherFromLocation(
          tLatitude, tLongitude)).thenAnswer((_) async => tWeatherModel);
      when(() => mockLocalDataSource.cacheCityName(tCityName))
          .thenAnswer((_) async {});

      // act
      repository.getWeatherFromLocation(tLatitude, tLongitude);
      // assert
      verify(() => mockNetworkInfo.isConnected);
    });

    _runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(() => mockRemoteDataSource.getWeatherFromLocation(
            tLatitude, tLongitude)).thenAnswer((_) async => tWeatherModel);
        when(() => mockLocalDataSource.cacheCityName(tCityName))
            .thenAnswer((_) async {});
        // act
        final result =
            await repository.getWeatherFromLocation(tLatitude, tLongitude);
        // assert
        verify(() =>
            mockRemoteDataSource.getWeatherFromLocation(tLatitude, tLongitude));
        expect(result, equals(const Right(tWeather)));
      });

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(() => mockRemoteDataSource.getWeatherFromLocation(
            tLatitude, tLongitude)).thenAnswer((_) async => tWeatherModel);
        when(() => mockLocalDataSource.cacheCityName(tCityName))
            .thenAnswer((_) async {});
        // act
        await repository.getWeatherFromLocation(tLatitude, tLongitude);
        // assert
        verify(() =>
            mockRemoteDataSource.getWeatherFromLocation(tLatitude, tLongitude));
        verify(() => mockLocalDataSource.cacheCityName(tCityName));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(() => mockRemoteDataSource.getWeatherFromLocation(
            tLatitude, tLongitude)).thenThrow(ServerException());
        // act
        final result =
            await repository.getWeatherFromLocation(tLatitude, tLongitude);
        // assert
        verify(() =>
            mockRemoteDataSource.getWeatherFromLocation(tLatitude, tLongitude));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    _runTestsOffline(() {
      test('should return NetworkFailure when device is offline', () async {
        // act
        final result =
            await repository.getWeatherFromLocation(tLatitude, tLongitude);

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Left(NetworkFailure())));
      });
    });
  });
}