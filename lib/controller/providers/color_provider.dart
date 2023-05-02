import 'dart:convert';

import 'package:color_palette/modals/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorProvider extends ChangeNotifier {
  List<ColorPalette> colorsList = [];
  bool isDataLoad = true;
  ColorPalette colorPalette = ColorPalette(
    color100: "0xffffcdd2",
    color200: "0xffef9a9a",
    color400: "0xffef5350",
    color600: "0xffe53935",
    color800: "0xffc62828",
    color900: "0xffb71c1c",
  );

  loadData() async {
    if (isDataLoad) {
      String json = await rootBundle.loadString("assets/json/colors.json");
      List data = jsonDecode(json);
      colorsList = data.map((e) => ColorPalette.fromJson(e)).toList();
      isDataLoad = false;
    }
  }

  changeColorPalette() {
    colorsList.shuffle();
    colorPalette = colorsList.first;
    notifyListeners();
  }
}
