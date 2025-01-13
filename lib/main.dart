import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/features/addRequest/presentation/request_Cubit/add_request_cubit.dart';
import 'package:hr/features/auth/presentation/auth_cubit/login_cubit.dart';
import 'package:hr/features/home/presentation/home_cubit/home_cubit.dart';
import 'app/app.dart';
import 'core/bloc/cubit/global_cubit.dart';
import 'core/database/cache_helper/cache_helper.dart';
import 'core/services/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();

  runApp(
      MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<GlobalCubit>(),
        ),

        BlocProvider(
          create: (BuildContext context) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<HomeCubit>(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<AddRequestCubit>()..getAllRequests(),
        ),

      ],
       child: const MyApp()));
}


