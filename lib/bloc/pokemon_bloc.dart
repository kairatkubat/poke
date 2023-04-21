import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_event.dart';
import 'package:pokemon/bloc/pokemon_state.dart';

import '../pokemon_repository.dart';


//  class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
//   final _pokemonRepository = PokemonRepository();
//   PokemonBloc() :super (PokemonInitial());


//   @override
//   Stream<PokemonState> mapEventToState(PokemonEvent event) async*{
//     if(event is PokemonPageRequest){
//       yield PokemonLoadInProgress();

//       try{
//         final pokemonPageResponse = await _pokemonRepository.getPokemonPage(event.page  );
//         yield PokemonPageLoadSuccess(
//           pokemonListings: pokemonPageResponse.pokemonListings, 
//           canLoadNextPage: pokemonPageResponse.canLoadNextPage);
//       }
//       catch(e) {
//         yield PokemonPageLoadFail(error: e as dynamic);
//       }
//     }
//   }

// }

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequest>(_onpokemonRepository);
  }

  final _pokemonRepository = PokemonRepository();

  void _onpokemonRepository(
      PokemonPageRequest event, Emitter<PokemonState> emit) async {
    emit(PokemonLoadInProgress());
    try {
      final pokemonPageResponse =
          await _pokemonRepository.getPokemonPage(event.page);
      emit(PokemonPageLoadSuccess(
          pokemonListings: pokemonPageResponse.pokemonListings,
          canLoadNextPage: pokemonPageResponse.canLoadNextPage));
    } catch (e) {
      emit(PokemonPageLoadFail(error: e as dynamic));
    }
  }
}