import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Constant.dart';
import 'package:shop_app/Cubit/cubit_cubit.dart';
import 'package:shop_app/Cubit/cubit_state.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: state is! GetScienceLoading,
            builder: (context) {
              var list = NewsCubit.get(context).science;
              return ListView.separated(
                  itemBuilder: (context, index) => articleBuild(article: list[index] , context: context),
                  separatorBuilder: (context, index) => mySizeBox(),
                  itemCount: list.length);
            });
      },
    );
  }
}
