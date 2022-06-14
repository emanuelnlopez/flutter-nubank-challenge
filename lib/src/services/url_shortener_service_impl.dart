import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:codingexercise/src/core/core.dart';
import 'package:codingexercise/src/model/shortened_url.dart';
import 'package:codingexercise/src/services/client/client.dart';
import 'package:codingexercise/src/services/url_shortener_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class UrlShortenerServiceImpl extends UrlShortenerService {
  UrlShortenerServiceImpl({
    required NetworkClient networkClient,
  }) : _networkClient = networkClient;

  final NetworkClient _networkClient;
  @override
  Future<Either<Failure, ShortenedUrl>> shortenUrl(String url) async {
    try {
      final response = await _networkClient.post(
        Uri.parse(Config.shortenUrlUrl),
        body: json.encode(
          {
            'url': url,
          },
        ),
      );

      if (response.statusCode != HttpStatus.ok) {
        throw Exception();
      }

      return compute(_parseResponse, response.body);
    } on Exception catch (_) {
      return Left(
        Failure(description: 'Ha ocurrido un error'),
      );
    }
  }

  Either<Failure, ShortenedUrl> _parseResponse(String responseBody) {
    return Right(
      ShortenedUrl.fromDynamic(
        json.decode(responseBody),
      ),
    );
  }
}
