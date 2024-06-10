import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartScreenController with ChangeNotifier {
  var myBox = Hive.box("textBox");
  void add() {}
}
