import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';

final injector = AutoInjector();

void setupDependencies() {
  // Register Dio
  injector.addInstance<Dio>(Dio());

  injector.commit();
}
