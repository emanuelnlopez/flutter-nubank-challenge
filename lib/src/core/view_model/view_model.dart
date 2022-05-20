import 'package:flutter/widgets.dart';

class ViewModel<T> extends ChangeNotifier {
  ViewModel(T state) : _state = state;

  String? _description;
  bool _disposed = false;
  T? _state;

  String? get description => _description;

  bool get disposed => _disposed;

  T? get state => _state;

  void setState(
    T state, {
    String? description,
  }) {
    _state = state;
    _description = description;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
