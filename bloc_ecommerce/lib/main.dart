import 'package:bloc/bloc.dart';
import 'package:bloc_ecommerce/app.dart';
import 'package:bloc_ecommerce/firebase_options.dart';
import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/data/preference/local_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = EcommerceBlocObserver();
  await LocalPreferences().init();
  runApp(const BlocEcommerceApp());
}
