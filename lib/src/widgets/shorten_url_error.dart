import 'package:flutter/material.dart';

class ShortenUrlError extends StatelessWidget {
  const ShortenUrlError({
    required this.error,
    Key? key,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Center(
          child: Text(
            error,
            style: const TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
