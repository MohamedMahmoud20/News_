// ignore_for_file: camel_case_types, must_be_immutable
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Constant.dart';
import 'package:shop_app/Cubit/cubit_cubit.dart';
import 'package:shop_app/Cubit/cubit_state.dart';

class Search_Screen extends StatelessWidget {
  Search_Screen({Key key}) : super(key: key);

  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: search,
                    onChanged: (value)async {
                      search.text = value;
                   await   cubit.getSearch(search.text);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                ConditionalBuilder(
                  condition: state is! GetSearchLoading,
                  builder: (context) {
                    var list = NewsCubit.get(context).search;
                    return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => articleBuild(
                              article: list[index], context: context),
                          separatorBuilder: (context, index) => mySizeBox(),
                          itemCount: list.length),
                    );
                  },
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ));
        },
        listener: (context, state) {});
  }
}
