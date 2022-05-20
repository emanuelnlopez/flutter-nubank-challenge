import 'dart:convert';
import 'dart:io';

import 'package:codingexercise/src/core/core.dart';
import 'package:codingexercise/src/model/model.dart';
import 'package:codingexercise/src/services/client/client.dart';
import 'package:dartz/dartz.dart';

class ShortenUrlUseCase extends UseCase<ShortenedUrl> {
  ShortenUrlUseCase({required NetworkClient networkClient})
      : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  Future<Either<Failure, ShortenedUrl>> execute({
    required Map<String, dynamic> arguments,
  }) async {
    try {
      final response = await _networkClient.post(
        Uri.parse(Config.shortenUrlUrl),
        body: json.encode(
          {
            'url': arguments[ShortenUrlUseCaseAttributesKeys.url],
          },
        ),
      );

      if (response.statusCode != HttpStatus.ok) {
        throw Exception();
      }

      final body = json.decode(response.body);

      return Right(
        ShortenedUrl.fromDynamic(body),
      );
    } on Exception catch (_) {
      return Left(
        Failure(description: 'Ha ocurrido un error'),
      );
    }
  }
}

abstract class ShortenUrlUseCaseAttributesKeys {
  static const url = 'url';
}
