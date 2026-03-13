import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recast_designs_assessment/presentation/controller/food_bloc.dart';
import 'package:recast_designs_assessment/presentation/controller/food_events.dart';
import 'package:recast_designs_assessment/presentation/screens/home_screen.dart';

import 'core/services/services_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>sl<FoodBloc>()..add(GetAtmosphereImagesEvent())..add(GetFoodMenuItemsEvent()),
        lazy: true,
      child: ScreenUtilInit(
        designSize: const Size(264, 572),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Homescreen(),
        ),
      ),
    );
  }
}