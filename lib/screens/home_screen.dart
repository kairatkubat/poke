import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_state.dart';

import '../bloc/pokemon_bloc.dart';

class HomePage extends StatelessWidget {
  static const routName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PokéMon")),

      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state){
        if(state is PokemonLoadInProgress){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is PokemonPageLoadSuccess){
          return GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
            itemCount: state.pokemonListings.length,
            itemBuilder: (context, index) {
              return Card(child:  GridTile(child:  Column(
                children: [
                   Image.network(state.pokemonListings[index].imageUrl ),
                   Text(state.pokemonListings[index].name)
                ],
              ),
              ),
              );
            },
            );
        }
         else if(state is PokemonPageLoadFail){
          return Center(
            child: Text(state.error.toString()),
          );
        }
        else {
          return Container(); 
        }
      },),
    );
  }
}