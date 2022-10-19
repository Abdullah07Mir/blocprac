import 'package:bloc_task_fluuter/Screens/recycle-bin.dart';
import 'package:bloc_task_fluuter/Screens/taskScreen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? OnGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => RecycleBin(),
        );
      case TaskScreen.id:
        return MaterialPageRoute(
          builder: (_) => TaskScreen(),
        );
        default:
        return null;
    }
  }
}
