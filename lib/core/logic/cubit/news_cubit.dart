import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/network/errors/exceptions.dart';
import 'package:news_app/core/reposotory.dart';
import 'package:news_app/models/article_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final Reposotory repo;
  NewsCubit({required this.repo}) : super(InitialState());

  Future<void> fetchNews({required String category}) async {
    emit(NewsLoading());
    try {
      List<Articles> articles = await repo.fetchTopHeadlines(
        category: category,
        country: "us",
      );
      emit(NewsSuccess(articles: articles));
    } on ServerExceptions catch (e) {
      emit(NewsError(message: e.errorModel.message ?? "An error occurred"));
    }
  }
}
