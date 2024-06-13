import 'package:flutter/material.dart';

extension GapSizer on num {
  SizedBox get heightGap => SizedBox(height: toDouble());
  SizedBox get widthGap => SizedBox(width: toDouble());
}
