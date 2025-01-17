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

/// 1) Initialize a TodosApi based on local storage, using SharedPreferences to save data
/// 2) Configures a global error handler for Flutter framework errors.
/// 3) Setup a custom BLoC observer
/// 4) Creates the todos and the weather repositories
/// 5) Configures hydrated storage for caching Bloc state across app restarts

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final todosApi = LocalStorageTodosApi(
    storage: await SharedPreferences.getInstance(),
  );
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
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
