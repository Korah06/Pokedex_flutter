import 'package:pokedex_test_flutter/domain/repositories/dio/IDioRepository.dart';

import '../../../data/models/Pokemon.dart';

class IDioPokemonRepository extends IDioRepository {
  static Future<Pokemon> getPokemon(int i) async {
    // TODO: Mirar como hacerlo sin usar IDioRepository
    final json = await IDioRepository.dioClient.get("/pokemon/$i");
    final Pokemon pokemon = Pokemon.fromJson(json.data);
    return pokemon;
  }
}
