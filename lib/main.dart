import 'dart:developer';


import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:local_storage_todos_api/local_storage_todos_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:space_scutum_todo/ui/widgets/app/app.dart';
import 'package:space_scutum_todo/ui/widgets/app/app_bloc_observer.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:weather_repository/weather_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final todosApi = LocalStorageTodosApi(
    storage: await SharedPreferences.getInstance(),
  );
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    log(error.toString(), stackTrace: stack);
    return true;
  };
  Bloc.observer = const AppBlocObserver();
  final todosRepository = TodosRepository(todosApi: todosApi);
  final weatherRepository = WeatherRepository();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  runApp(
    App(
      todosRepository: todosRepository,
      weatherRepository: weatherRepository,
    ),
  );
}
