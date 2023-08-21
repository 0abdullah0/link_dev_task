import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:link_dev_task/app/domain/repositories/home_repository.dart';
import 'package:link_dev_task/app/domain/usecases/fetch_associated_press.dart';
import 'package:link_dev_task/app/domain/usecases/fetch_next_web.dart';
import 'package:link_dev_task/app/pages/home/home_bloc/home_bloc.dart';
import 'package:link_dev_task/app/pages/home/widgets/feed_card.dart';
import 'package:link_dev_task/app/pages/home/widgets/home_drawer.dart';
import 'package:link_dev_task/app/widgets/app_top_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(
        homeRepository: GetIt.I.get<HomeRepository>(),
        fetchAssociatedPress: GetIt.I.get<FetchAssociatedPress>(),
        fetchNextWeb: GetIt.I.get<FetchNextWeb>(),
      )..add(NewsFeedsFetched()),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: const AppTopBar(title: 'LINK DEVELOPMENT'),
      drawer: const HomeDrawer(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (_, state) {
          if (state is NewsFeedsLoadFailure) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18.sp,
                ),
              ),
            );
          }
          if (state is NewsFeedsLoadInProgress) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is NewsFeedsLoadSuccess) {
            return Center(
              child: ListView.separated(
                padding: const EdgeInsets.all(16).r,
                itemBuilder: (_, index) => FeedCard(
                  article: state.articles[index],
                ),
                separatorBuilder: (_, index) => 8.verticalSpace,
                itemCount: state.articles.length,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
