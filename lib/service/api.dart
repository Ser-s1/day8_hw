import 'dart:convert';

import 'package:day8_hw/models/disney.dart';
import 'package:http/http.dart' as http;


class Api {
  String link = "https://dummyjson.com/products";

/// this is response of characters
 Future<List<Disney>> getData() async{
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var result = jsonDecode(response.body);

    List<Disney> disneyList = [];

    for (var item in result["products"]) {
      Disney d1 = Disney.fromJson(item);
      disneyList.add(d1);
    }

    return disneyList;
  }
}