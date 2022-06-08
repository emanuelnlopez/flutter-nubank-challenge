import 'package:codingexercise/src/core/core.dart';
import 'package:codingexercise/src/model/model.dart';
import 'package:dartz/dartz.dart';

abstract class UrlShortenerService {
  Future<Either<Failure, ShortenedUrl>> shortenUrl(String url);
}
