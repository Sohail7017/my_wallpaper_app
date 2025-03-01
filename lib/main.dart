import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallpaper/screens/home/cubit/wallpaper_cubit.dart';
import 'package:my_wallpaper/screens/home/home_page.dart';

import 'data/remote/api_helper.dart';
import 'data/repository/wallpaper_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) => WallpaperCubit(wallpaperRepository: WallpaperRepository(apiHelper: ApiHelper())),
      child: HomePage(),
      )
    );
  }
}
