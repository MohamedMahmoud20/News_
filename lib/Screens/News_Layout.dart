import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Cubit/cubit_cubit.dart';
import 'package:shop_app/Cubit/cubit_state.dart';
import 'package:shop_app/Screens/Search/Search_Screen.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    return Search_Screen();
                  }));
                }, icon:Icon(Icons.search , color: cubit.isDark? Colors.white: Colors.black,)),
                IconButton(onPressed: (){
                  cubit.changeTheme();
                }, icon:Icon(Icons.brightness_4_sharp , color: cubit.isDark? Colors.white: Colors.black,))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItem,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNav(index);
              },
            ),
          );
        });
  }
}