import 'package:fit_tracker/service/navigation_service.dart';
import 'package:fit_tracker/view/details_screen_view_model.dart';
import 'package:fit_tracker/view/login_screen_view_model.dart';
import 'package:fit_tracker/view/main_screen_view_model.dart';
import 'package:fit_tracker/view/user_profile_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => DetailsScreenViewModel());
  getIt.registerFactory(() => MainScreenViewModel());
  getIt.registerFactory(() => UserProfileViewModel());
  getIt.registerFactory(() => LoginScreenViewModel());
}