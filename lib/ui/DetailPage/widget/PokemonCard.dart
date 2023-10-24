import 'package:flutter/material.dart';
import 'package:pokedex_test_flutter/data/models/Pokemon.dart';
import 'package:pokedex_test_flutter/ui/PokedexPage/PokedexPage.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: typeColors[pokemon.types[0]]?.withOpacity(0.4),
        height: 400,
        width: 400,
        child: Hero(
            tag: "pokemonImage${pokemon.id}",
            child: Image.network(pokemon.imageUrl)),
    );
  }
}
