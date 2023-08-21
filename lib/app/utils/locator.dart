import 'package:get_it/get_it.dart';
import 'package:link_dev_task/app/data/helpers/http_client_service.dart';
import 'package:link_dev_task/app/data/repositories/home_repository_impl.dart';
import 'package:link_dev_task/app/domain/repositories/home_repository.dart';
import 'package:link_dev_task/app/domain/usecases/fetch_associated_press.dart';
import 'package:link_dev_task/app/domain/usecases/fetch_next_web.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerSingleton<HttpClientService>(HttpClientService())
    ..registerSingleton<HomeRepository>(
      HomeRepositoryImpl(GetIt.I.get<HttpClientService>()),
    )
    ..registerSingleton<FetchAssociatedPress>(
      FetchAssociatedPress(GetIt.I.get<HomeRepository>()),
    )
    ..registerSingleton<FetchNextWeb>(
      FetchNextWeb(GetIt.I.get<HomeRepository>()),
    );
}
