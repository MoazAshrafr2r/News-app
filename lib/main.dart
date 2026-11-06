import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_router.dart';
import 'package:news_app/core/logic/cubit/news_cubit.dart';
import 'package:news_app/core/network/dio_consumer.dart';
import 'package:news_app/core/reposotory.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsCubit(repo: Reposotory(Api: DioConsumer(Dio())))
            ..fetchNews(category: 'general'),
      child: MaterialApp(onGenerateRoute: AppRouter().GenerateRoute),
    );
  }
}
