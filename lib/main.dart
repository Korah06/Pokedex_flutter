import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_test_flutter/domain/repositories/dio/dio_pokemon.dart';

import 'domain/bloc/pokemon/pokemon_bloc.dart';
import 'ui/PokedexPage/PokedexPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonBloc()..add(LoadPokemonEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange, background: Colors.white),
          useMaterial3: true,
        ),
        home: const PokedexPage(),
      ),
    );
  }
}
