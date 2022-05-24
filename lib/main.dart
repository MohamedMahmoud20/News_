import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Cubit/cubit_cubit.dart';
import 'package:shop_app/Cubit/cubit_state.dart';
import 'package:shop_app/shared/CacheHelper.dart';
import 'Cubit/Bloc_observer.dart';
import 'Screens/News_Layout.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
 var dark= await CacheHelper.getData("Theme");
 print("MainDark = = $dark");
  Bloc.observer = MyBlocObserver();

  runApp(MyApp(dark:dark));
}

class MyApp extends StatelessWidget {
  final dark;
  const MyApp({
    this.dark,
  });
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context) => NewsCubit()..changeTheme(fromShared: dark)
      ..getSports()
      ..getBusiness()
      ..getScience(),
    child: BlocConsumer<NewsCubit,NewsStates>(
      listener: (context , state){},
    builder: (context , state){
        var cubit= NewsCubit.get(context);
        return MaterialApp(
            theme: ThemeData(
              textTheme: TextTheme(bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  elevation: 5,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey) ,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold)),
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.7)),bodyLarge: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.black54,
                  elevation: 5,
                  selectedItemColor: Colors.amber,
                  unselectedItemColor: Colors.grey) ,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: AppBarTheme(
                  elevation: 0,
                  backgroundColor: Colors.black,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold)),
            ),
            themeMode: cubit.isDark? ThemeMode.dark: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: LayoutScreen());
    },
    ));
  }
}