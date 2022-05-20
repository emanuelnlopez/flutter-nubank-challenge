import 'package:codingexercise/src/model/shortened_url.dart';
import 'package:flutter/material.dart';

class ShortenUrlResults extends StatelessWidget {
  const ShortenUrlResults({
    Key? key,
    required this.results,
  }) : super(key: key);

  final List<ShortenedUrl> results;

  @override
  Widget build(BuildContext context) {
    Widget result = const Expanded(
      child: Center(
        child: Text('No hay direcciones acortadas'),
      ),
    );

    if (results.isNotEmpty == true) {
      result = Expanded(
        child: ListView.separated(
          itemBuilder: (_, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Alias: ${results[index].alias}'),
              Text('Self: ${results[index].links.self}'),
              Text('Short: ${results[index].links.short}'),
            ],
          ),
          itemCount: results.length,
          separatorBuilder: (_, __) => const Divider(),
        ),
      );
    }

    return result;
  }
}
