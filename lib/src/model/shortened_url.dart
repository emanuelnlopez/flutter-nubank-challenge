import 'package:codingexercise/src/model/model.dart';

class ShortenedUrl {
  ShortenedUrl({
    required this.alias,
    required this.links,
  });

  factory ShortenedUrl.fromDynamic(dynamic map) => ShortenedUrl(
        alias: map[_AttributesKeys.alias],
        links: Links.fromDynamic(map[_AttributesKeys.links]),
      );

  final String alias;
  final Links links;
}

abstract class _AttributesKeys {
  static const alias = 'alias';
  static const links = '_links';
}
