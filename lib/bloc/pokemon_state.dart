
import 'package:pokemon/poke_page_resp.dart';

abstract class PokemonState{}

class PokemonInitial extends PokemonState{

}

class PokemonLoadInProgress extends PokemonState{}

class PokemonPageLoadSuccess extends PokemonState{
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess({required this.pokemonListings, required this.canLoadNextPage});
}

class PokemonPageLoadFail extends PokemonState{
  final Error error;

  PokemonPageLoadFail({required this.error});
}