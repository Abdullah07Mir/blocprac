import 'package:bloc_task_fluuter/Screens/taskScreen.dart';
import 'package:bloc_task_fluuter/serveces/app_router.dart';
import 'package:bloc_task_fluuter/serveces/app_theam.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/block_export.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //hyderated storage will call native calls with out this binding we don't call native calls
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // ignore: deprecated_member_use
  HydratedBlocOverrides.runZoned(
    () => runApp(
      MyApp(
        appRouter: AppRouter(),
      ),
    ),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBlocBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBlocBloc, SwitchBlocState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.switchValue? AppThemes.appThemeData[AppTheme.darkTheme]:
            AppThemes.appThemeData[AppTheme.lightTheme],
            home: TaskScreen(),
            onGenerateRoute: appRouter.OnGenerateRoute,
          );
        },
      ),
    );
  }
}
