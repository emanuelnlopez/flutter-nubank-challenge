import 'package:codingexercise/src/core/core.dart';
import 'package:codingexercise/src/features/home/home_view_model.dart';
import 'package:codingexercise/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildBody(HomeViewModel viewModel) {
    Widget body;
    if (viewModel.state == HomeViewState.loading) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      body = Column(
        children: [
          ShortenUrlField(
            onPressed: (url) => viewModel.shortenUrl(url),
          ),
          const SizedBox(height: 12.0),
          viewModel.state == HomeViewState.error
              ? ShortenUrlError(
                  error: viewModel.description ?? 'Ha ocurrido un error',
                )
              : ShortenUrlResults(
                  results: viewModel.shortenedUrlList,
                ),
        ],
      );
    }
    return body;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('URL Shortener'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChangeNotifierProvider<HomeViewModel>(
            create: (_) => context.read<Injector>().homeViewModel,
            child: Consumer<HomeViewModel>(
              builder: (_, viewModel, __) => _buildBody(viewModel),
            ),
          ),
        ),
      );
}
