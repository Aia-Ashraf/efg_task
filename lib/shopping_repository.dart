import 'dart:convert';

import 'package:dio/dio.dart';
import 'shopping_model.dart';

class ShoppingRepository {
  Future <List<ShoppingModel>> getShoppingList ()  async {
    var dio = Dio();
    var shoppingList = List<ShoppingModel>();
    final response = await dio.get('https://fakestoreapi.com/products');
    print(response.data);
    if (response.statusCode == 200) {
      final List<dynamic> data = (response.data);
      shoppingList = List<ShoppingModel>.from(
          data.map((i) => ShoppingModel.fromJson(i)));
      return shoppingList;
    } else {
      throw Exception('Failed to load album');
    }
  }
}