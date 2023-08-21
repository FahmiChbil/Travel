import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mylasttravelapp/Auth/domain/usecases/sign_up.dart';

import 'Auth/data/datasources/auth_remote_data_source.dart';
import 'Auth/data/repositories/Auth_repo_imlp.dart';
import 'Auth/domain/repositories/auth_repository.dart';
import 'Auth/domain/usecases/SignIn.dart';
import 'Auth/presentation/bloc/cubit/auth_cubit.dart';
import 'core/Network/networ_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // feature Auth
  // bloc
  sl.registerFactory(() => AuthCubit(signInUseCase: sl(), signUpUseCase: sl()));
// usecases
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  //repo
  sl.registerLazySingleton<AuthRepositories>(() =>
      AuthrepositoryImpl(implAuthRemoteDataSource: sl(), networkInfo: sl()));

  //datasources

  sl.registerLazySingleton(() => ImplAuthRemoteDataSource());

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
