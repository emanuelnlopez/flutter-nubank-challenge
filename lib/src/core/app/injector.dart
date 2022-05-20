import 'dart:async';

import 'package:codingexercise/src/features/home/home_view_model.dart';
import 'package:codingexercise/src/services/client/client.dart';
import 'package:codingexercise/src/use_cases/use_cases.dart';

abstract class Injector {
  HomeViewModel get homeViewModel;

  Stream<bool> get initializationStream;

  Future<void> initialize();

  void dispose();

  bool isInitialized();
}

class DefaultInjector implements Injector {
  final StreamController<bool> _initializationStreamController =
      StreamController<bool>.broadcast();

  bool _initialized = false;
  late NetworkClient _networkClient;
  late ShortenUrlUseCase _shortenUrlUseCase;

  @override
  HomeViewModel get homeViewModel => HomeViewModel(
        shortenUrlUseCase: _shortenUrlUseCase,
      );

  @override
  Stream<bool> get initializationStream =>
      _initializationStreamController.stream;

  @override
  Future<void> initialize() async {
    if (!isInitialized()) {
      _networkClient = NetworkClient();

      _shortenUrlUseCase = ShortenUrlUseCase(
        networkClient: _networkClient,
      );

      _initialized = true;
      _initializationStreamController.add(_initialized);
    }
  }

  @override
  void dispose() {
    _initialized = false;
    _initializationStreamController.add(_initialized);
    _initializationStreamController.close();
  }

  @override
  bool isInitialized() => _initialized;
}
