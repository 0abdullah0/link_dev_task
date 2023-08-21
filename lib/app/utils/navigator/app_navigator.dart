// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:link_dev_task/app/domain/entities/article/article.dart';
import 'package:link_dev_task/app/pages/details/details_view.dart';
import 'package:link_dev_task/app/pages/home/home_view.dart';
import 'package:link_dev_task/app/utils/navigator/routes.dart';

class AppNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.detailsRoute:
        return MaterialPageRoute(
          builder: (_) => DetailsView(
            article: args['article'] as Article,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No Views for that root'),
              ),
            );
          },
        );
    }
  }
}
