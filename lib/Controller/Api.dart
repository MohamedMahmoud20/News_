import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/Constant.dart';

class HttpHelper {
  static Future getData({@required country, @required category}) async {
    var response = await http.get(
        Uri.parse("${baseUrl + "country=$country&category=$category" + key}"));
    var data = jsonDecode(response.body)['articles'];
    return data;
  }

  static Future getSearch({@required search}) async {
    var response = await http.get(
        Uri.parse("https://newsapi.org/v2/everything?q=$search=2022-04-22&sortBy=publishedAt&apiKey=50636db3bbf44b8384e182d36cd6d0d2"));
    var data = jsonDecode(response.body)['articles'];
    return data;
  }
}