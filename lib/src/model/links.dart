class Links {
  Links({
    required this.self,
    required this.short,
  });

  factory Links.fromDynamic(dynamic map) => Links(
        self: map[_AttributesKeys.self],
        short: map[_AttributesKeys.short],
      );

  final String self;
  final String short;
}

abstract class _AttributesKeys {
  static const self = 'self';
  static const short = 'short';
}
