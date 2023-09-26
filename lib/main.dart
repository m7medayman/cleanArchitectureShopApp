import 'package:flutter/material.dart';
import 'package:mvvm_shop/app/di.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGet();
  runApp(MyApp());
}
