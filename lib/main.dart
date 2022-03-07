import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_morty_challenge/injector_container.dart' as di;
import 'package:rick_morty_challenge/view/logic/get_characeter.cubit/get_character_cubit.dart';
import 'package:rick_morty_challenge/view/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (_) => di.sl<GetCharacterCubit>(),
        child: const HomePage()
      ),
    );
  }
}
