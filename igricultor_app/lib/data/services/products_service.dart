// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:igricultor_app/data/models/show_case.dart';

class ProductsService {
  static Future<ShowCase> getShowCase() async {
    // ignore: prefer_typing_uninitialized_variables
    var data;
    final String response =
        await rootBundle.loadString('assets/db/vitrine.json');
    try {
      data = await json.decode(response);
    } catch (e) {
      print('ERRO AQUI $e');
    }
    return ShowCase.fromJson(data);
  }
}
