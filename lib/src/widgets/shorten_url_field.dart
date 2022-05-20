import 'package:flutter/material.dart';

class ShortenUrlField extends StatefulWidget {
  const ShortenUrlField({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function(String url) onPressed;

  @override
  State<ShortenUrlField> createState() => _ShortenUrlFieldState();
}

class _ShortenUrlFieldState extends State<ShortenUrlField> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              controller: _urlController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8.0),
                hintText: 'http://www.google.com',
                labelText: 'Ingrese URL',
              ),
              validator: (value) {
                String? result;
                if (value?.isNotEmpty != true) {
                  result = 'Valor requerido';
                } else {
                  final validUrl = Uri.parse(value!).isAbsolute;
                  if (!validUrl) {
                    result = 'La URL ingresada no es válida';
                  }
                }
                return result;
              },
            ),
          ),
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onPressed(_urlController.text);
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
