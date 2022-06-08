import 'package:codingexercise/src/core/core.dart';
import 'package:codingexercise/src/model/model.dart';
import 'package:codingexercise/src/services/url_shortener_service.dart';
import 'package:dartz/dartz.dart';

class ShortenUrlUseCase extends UseCase<ShortenedUrl> {
  ShortenUrlUseCase({
    required UrlShortenerService urlShortenerService,
  }) : _urlShortenerService = urlShortenerService;

  final UrlShortenerService _urlShortenerService;

  @override
  Future<Either<Failure, ShortenedUrl>> execute({
    required Map<String, dynamic> arguments,
  }) async {
    return await _urlShortenerService.shortenUrl(
      arguments[ShortenUrlUseCaseAttributesKeys.url],
    );
  }
}

abstract class ShortenUrlUseCaseAttributesKeys {
  static const url = 'url';
}
