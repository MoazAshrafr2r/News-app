

part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class InitialState extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<Articles> articles;
  NewsSuccess({required this.articles});
  
}

final class NewsError extends NewsState {
  final String message;
  NewsError({required this.message});
}
