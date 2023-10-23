import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../domain/bloc/pokemon/pokemon_bloc.dart';
import '../DetailPage/DetailPage.dart';

const Map<String, Color> typeColors = {
  'normal': Colors.green,
  'fire': Colors.red,
  'water': Colors.blue,
  'grass': Colors.greenAccent,
  'electric': Colors.yellow,
  'fighting': Colors.orange,
  'ground': Colors.brown,
  'psychic': Colors.pink,
  'rock': Colors.grey,
  'ice': Colors.lightBlue,
  'bug': Colors.lightGreen,
  'ghost': Colors.purple,
  'steel': Colors.indigo,
  'dragon': Colors.cyan,
  'dark': Colors.brown,
  'fairy': Colors.pinkAccent,
  'poison': Colors.purpleAccent,
  'flying': Colors.blueAccent,
};

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {


    final pokemonBloc = context.read<PokemonBloc>();
    final navigator = Navigator.of(context);
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, pokemonState) {
        if (pokemonState.status == PokemonStatus.loading) {
          return Center(
              child: CircularPercentIndicator(
            radius: 150,
            lineWidth: 10,
            percent: pokemonState.progress,
            progressColor: Colors.orange,
            backgroundColor: Colors.orange.withOpacity(0.4),
                circularStrokeCap: CircularStrokeCap.round,
                center: Text("${(pokemonState.progress*100).toStringAsFixed(2)}%", style: const TextStyle(fontSize: 30, color: Colors.white70),),
          ));
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Pokedex"),
            backgroundColor: Colors.orange[200],
          ),
          body: MasonryGridView.builder(
            itemCount: pokemonState.pokemons.length,
            gridDelegate:
                const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              final pokemon = pokemonState.pokemons[index];
              return GestureDetector(
                onTap: () {
                  pokemonBloc.add(SelectPokemonEvent(pokemon: pokemon));
                  navigator.push(MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                            value: pokemonBloc,
                            child: DetailPage(currentPokemon: pokemon, allPokemon: pokemonState.pokemons),
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    minRadius: 70,
                    backgroundColor: typeColors[pokemon.types[0]]?.withOpacity(0.4),
                    child: Hero(tag: "pokemonImage${pokemon.id}", child: Image.network(pokemon.imageUrl)),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
