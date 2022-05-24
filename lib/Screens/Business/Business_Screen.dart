import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Constant.dart';
import 'package:shop_app/Cubit/cubit_cubit.dart';
import 'package:shop_app/Cubit/cubit_state.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var list = cubit.business;
        return ConditionalBuilder(
          fallback: (context)=>Center(child: CircularProgressIndicator(color: Colors.black,),),
            condition: state is! GetBusinessLoading,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return articleBuild(article: list[index], context: context);
                    },
                    separatorBuilder: (context, index) =>mySizeBox(),
                    itemCount: list.length),
              );
            });
      },
    );
  }
}