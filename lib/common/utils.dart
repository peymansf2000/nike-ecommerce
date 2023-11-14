import 'package:flutter/cupertino.dart';

const ScrollPhysics defaultScrollPhysics = BouncingScrollPhysics();

extension PriceLabel on int {
  String get withPriceLabel => '$this تومان';
}
