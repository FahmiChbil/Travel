import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mylasttravelapp/Auth/domain/usecases/sign_up.dart';
import 'package:mylasttravelapp/Hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:mylasttravelapp/Hotel/data/repository/hotel_repository_impl.dart';
import 'package:mylasttravelapp/Hotel/domain/repositories/hotel_repository.dart';
import 'package:mylasttravelapp/Hotel/domain/usecases/get_all_hotels_use_case.dart';
import 'package:mylasttravelapp/Hotel/domain/usecases/get_all_places_use_case.dart';
import 'package:mylasttravelapp/Hotel/presentation/Cubit/cubit/all_hotels_cubit.dart';
import 'package:mylasttravelapp/Hotel/presentation/Hotels_cubit/hotels_cubit.dart';

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
  sl.registerFactory(() => AllHotelsCubit(getAllHotelsUseCase: sl()));
  sl.registerFactory(() => HotelsCubit(getAllPlacesUseCase: sl()));
// usecases
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => GetAllPlacesUseCase(sl()));
  sl.registerLazySingleton(() => GetAllHotelsUseCase(sl()));
  //repo
  sl.registerLazySingleton<AuthRepositories>(() =>
      AuthrepositoryImpl(implAuthRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HotelRepository>(() =>
      HotelRepositoryImpl(hotelRemoteDataSourceImpl: sl(), networkInfo: sl()));

  //datasources

  sl.registerLazySingleton(() => ImplAuthRemoteDataSource());
  sl.registerLazySingleton(() => HotelRemoteDataSourceImpl());

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
