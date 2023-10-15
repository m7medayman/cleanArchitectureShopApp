import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

myText(String t, {TextStyle? style}) {
  return Text(
    t.tr(),
    style: style,
  );
}
