import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Constant.dart';
import 'package:shop_app/Cubit/cubit_cubit.dart';
import 'package:shop_app/Cubit/cubit_state.dart';
class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit ,  NewsStates>(
      listener: (context , state){},
      builder: (context , state){
        var list= NewsCubit.get(context).sports;
        return ConditionalBuilder(
          fallback: (context)=> Center(child: CircularProgressIndicator()),
            condition:list is! GetSportsLoading ,
            builder: (context)=> ListView.separated(
              physics: BouncingScrollPhysics(),
            itemBuilder: (context , index)=>
                articleBuild(article: list[index] , context: context),
            separatorBuilder: (context , index)=>mySizeBox(),
            itemCount: list.length));
      },
    );
  }
}