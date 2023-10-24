import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_test_flutter/data/models/Pokemon.dart';
import 'package:pokedex_test_flutter/ui/DetailPage/widget/PokemonCard.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

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
  late Pokemon _selectedPokemon;
  late List<Pokemon> pokemons;

  @override
  void initState() {
    super.initState();
    _selectedPokemon = widget.currentPokemon;
    pokemons = widget.allPokemon;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(title: Text(_selectedPokemon.name)),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PokemonCard(pokemon: _selectedPokemon),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (_selectedPokemon.id == 0) {
                              _selectedPokemon = pokemons[pokemons.length - 1];
                            } else {
                              _selectedPokemon = pokemons[_selectedPokemon.id - 1];
                            }
                          });
                        },
                        child: const Text("Anterior")),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (_selectedPokemon.id == pokemons.length - 1) {
                              _selectedPokemon = pokemons[0];
                            } else {
                              _selectedPokemon = pokemons[_selectedPokemon.id + 1];
                            }
                          });
                        },
                        child: const Text("Siguiente"))
                  ],
                ),
              )
            ],
          )

          // body: Hero(
          //     tag: "pokemonImage${_selectedPokemon.id}",
          //     child: Image.network(_selectedPokemon.imageUrl)),
          ),
    );
  }
}
