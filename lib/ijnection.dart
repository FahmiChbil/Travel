import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mylasttravelapp/Auth/domain/usecases/sign_out.dart';
import 'package:mylasttravelapp/Auth/domain/usecases/sign_up.dart';
import 'package:mylasttravelapp/Hotel/data/datasources/hotel_remote_datasource.dart';
import 'package:mylasttravelapp/Hotel/data/repository/hotel_repository_impl.dart';
import 'package:mylasttravelapp/Hotel/domain/repositories/hotel_repository.dart';
import 'package:mylasttravelapp/Hotel/domain/usecases/get_all_hotels_use_case.dart';
import 'package:mylasttravelapp/Hotel/domain/usecases/get_all_places_use_case.dart';
import 'package:mylasttravelapp/Hotel/domain/usecases/pay_hotel.dart';
import 'package:mylasttravelapp/Hotel/presentation/Cubit/cubit/all_hotels_cubit.dart';
import 'package:mylasttravelapp/Hotel/presentation/Cubit/cubit/pay_cubit_cubit.dart';
import 'package:mylasttravelapp/Hotel/presentation/Hotels_cubit/hotels_cubit.dart';
import 'package:mylasttravelapp/admin/data/datasources/admin_remote_datasources.dart';
import 'package:mylasttravelapp/admin/data/repository/admin_repository_impl.dart';
import 'package:mylasttravelapp/admin/domain/repository/Admin_repository.dart';
import 'package:mylasttravelapp/admin/domain/usecases/add_data.dart';
import 'package:mylasttravelapp/admin/presentation/cubit/edit_data_cubit.dart';

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
  sl.registerFactory(() => AuthCubit(
      signInUseCase: sl(), signUpUseCase: sl(), signOutUseCase: sl()));
  sl.registerFactory(() => AllHotelsCubit(getAllHotelsUseCase: sl()));
  sl.registerFactory(() => HotelsCubit(getAllPlacesUseCase: sl()));
  sl.registerFactory(() => PayCubitCubit(payHotelUseCase: sl()));
  sl.registerFactory(() => EditDataCubit(addDataUseCase: sl()));

// usecases
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => GetAllPlacesUseCase(sl()));
  sl.registerLazySingleton(() => GetAllHotelsUseCase(sl()));
  sl.registerLazySingleton(() => PayHotelUseCase(sl()));
  sl.registerLazySingleton(() => AddDataUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  //repo
  sl.registerLazySingleton<AuthRepositories>(() =>
      AuthrepositoryImpl(implAuthRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HotelRepository>(() =>
      HotelRepositoryImpl(hotelRemoteDataSourceImpl: sl(), networkInfo: sl()));
  sl.registerLazySingleton<AdminRepository>(() =>
      AdminRepositoryImpl(networkInfo: sl(), adminRemoteDataSourcImpl: sl()));

  //datasources

  sl.registerLazySingleton(() => ImplAuthRemoteDataSource());
  sl.registerLazySingleton(() => HotelRemoteDataSourceImpl());
  sl.registerLazySingleton(() => AdminRemoteDataSourcImpl());

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
