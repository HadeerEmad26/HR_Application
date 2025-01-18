
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hr/core/database/sqf_helper/sqf_helper.dart';
import 'package:hr/features/addRequest/data/repository/request_repo.dart';
import 'package:hr/features/addRequest/presentation/leave_type_cubit/leave_type_cubit.dart';
import 'package:hr/features/addRequest/presentation/request_Cubit/add_request_cubit.dart';
import 'package:hr/features/home/presentation/home_cubit/home_cubit.dart';

import '../../features/auth/data/reposetry/auth_repo.dart';
import '../../features/auth/presentation/auth_cubit/login_cubit.dart';
import '../bloc/cubit/global_cubit.dart';
import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';
import '../database/cache_helper/cache_helper.dart';

final sl = GetIt.instance;

void initServiceLocator(){
  //cubit
  sl.registerLazySingleton(()=> GlobalCubit());
  sl.registerLazySingleton(()=> LoginCubit(sl()));
  sl.registerLazySingleton(()=> HomeCubit());
  sl.registerLazySingleton(()=> LeaveTypeCubit(sl()));
  sl.registerLazySingleton(()=> AddRequestCubit(sl()));


  //auth feature
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => RequestsRepository());


  //external
  sl.registerLazySingleton(()=> CacheHelper());
  sl.registerLazySingleton(()=> SqfliteHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}