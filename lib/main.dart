import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:local_storage_todos_api/local_storage_todos_api.dart';
import 'package:space_scutum_todo/ui/widgets/app/app.dart';
import 'package:space_scutum_todo/ui/widgets/app/app_bloc_observer.dart';
import 'package:todos_repository/todos_repository.dart';

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
  runApp(App(todosRepository: todosRepository));
}
