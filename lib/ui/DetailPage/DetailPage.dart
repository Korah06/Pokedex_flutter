import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_test_flutter/data/models/Pokemon.dart';

import '../../domain/bloc/pokemon/pokemon_bloc.dart';
import '../PokedexPage/PokedexPage.dart';

class DetailPage extends StatefulWidget {
  final Pokemon currentPokemon;
  final List<Pokemon> allPokemon;

  const DetailPage({super.key, required this.currentPokemon, required this.allPokemon});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        backgroundColor: typeColors[widget.currentPokemon.types[0]]?.withOpacity(0.4),
        appBar: AppBar(title: Text(widget.currentPokemon.name)),
        body: Hero(tag: "pokemonImage${widget.currentPokemon.id}", child: Image.network(widget.currentPokemon.imageUrl)),
      ),
    );
  }
}
