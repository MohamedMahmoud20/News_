
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Controller/Api.dart';
import 'package:shop_app/Cubit/cubit_state.dart';
import 'package:shop_app/Screens/Business/Business_Screen.dart';
import 'package:shop_app/Screens/Science/Science_Screen.dart';
import 'package:shop_app/Screens/Sports/Sports_Screen.dart';
import 'package:shop_app/shared/CacheHelper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science")
  ];
  List<Widget> screens = [
    SportsScreen(),
    BusinessScreen(),
    ScienceScreen(),
  ];
  void changeNav(index) {
    currentIndex = index;
    emit(BottomNav());
  }

  List business = [];
  List sports = [];
  List science = [];
  List search = [];
  getBusiness() {
    emit(GetBusinessLoading());
    HttpHelper.getData(country: "eg", category: "business").then((value) {
      business = value;
      emit(GetBusinessSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessError(error: error));
    });
  }
  getSports() {
    emit(GetSportsLoading());
    HttpHelper.getData(country: "eg", category: "sports").then((value) {
      sports = value;
      emit(GetSportsSuccess());
    }).catchError((error) {
      emit(GetSportsError(error: error));
    });
  }
  getScience() {
    emit(GetScienceLoading());
    HttpHelper.getData(country: "eg", category: "science").then((value) {
      science = value;
      emit(GetScienceSuccess());
    }).catchError((error) {
      emit(GetScienceError(error: error));
    });
  }
  getSearch(value) {
    emit(GetSearchLoading());
    HttpHelper.getSearch(search: "$value").then((value) {
      search=[];
      search = value;
      emit(GetSearchSuccess());
    }).catchError((error) {
      emit(GetSearchError(error: error));
    });
  }

  bool isDark=false;
  changeTheme({bool fromShared})async{
    if(fromShared!=null){
      isDark=fromShared;
      emit(DarkTheme());
    }else{
      isDark=!isDark;
      await CacheHelper.setBoolean("Theme", isDark);
      emit(DarkTheme());
    }

  }
}