import 'package:codingexercise/src/core/core.dart';
import 'package:codingexercise/src/model/model.dart';
import 'package:codingexercise/src/use_cases/shorten_url_use_case.dart';

enum HomeViewState {
  completed,
  error,
  initial,
  loading,
}

class HomeViewModel extends ViewModel<HomeViewState> {
  HomeViewModel({required ShortenUrlUseCase shortenUrlUseCase})
      : _shortenUrlUseCase = shortenUrlUseCase,
        super(HomeViewState.initial);

  final ShortenUrlUseCase _shortenUrlUseCase;

  final List<ShortenedUrl> _shortenedUrlList = [];

  List<ShortenedUrl> get shortenedUrlList => _shortenedUrlList;

  void shortenUrl(String url) async {
    setState(HomeViewState.loading);
    final result = await _shortenUrlUseCase.execute(
      arguments: {ShortenUrlUseCaseAttributesKeys.url: url},
    );

    result.fold(
      (failure) => setState(
        HomeViewState.error,
        description: failure.description,
      ),
      (result) {
        _shortenedUrlList.insert(0, result);
        setState(HomeViewState.completed);
      },
    );
  }
}
