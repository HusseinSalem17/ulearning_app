import 'package:flutter/material.dart';
import 'package:udemy_app/common/widgets/reusable_text.dart';

AppBar buildAppBarReusable(String url) {
  return AppBar(
    title: reusableText(url),
  );
}
