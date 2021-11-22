import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogjakarir_app/cubit/cubit.dart';
import 'package:jogjakarir_app/cubit/job_cubit.dart';
import 'package:jogjakarir_app/cubit/user_cubit.dart';
import 'package:jogjakarir_app/ui/pages/pages.dart';
import 'package:get/get.dart';

import 'cubit/apply_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => JobCubit()),
        BlocProvider(create: (_) => CompanyCubit()),
        BlocProvider(create: (_) => ApplyCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}
