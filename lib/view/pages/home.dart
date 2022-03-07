import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_challenge/view/logic/get_characeter.cubit/get_character_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetCharacterCubit, GetCharacterState>(
        builder: (context, state) {
          if (state is GetCharacterInitial) {
            context.read<GetCharacterCubit>().getCharacters();
            return Center(
              child: Column(
              children: const [
                Text('Welcome! wait the characters...'),
                CircularProgressIndicator(),
              ],
            ));
          } else if (state is GetCharacterLoading) {
            return  const Center(child: CircularProgressIndicator());
          } else if (state is GetCharacterLoaded) {
            final characters = state.characters;
            if (characters.isNotEmpty) {
              return SingleChildScrollView(
                // controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 32.0,),
                    const Text('Welcome to Layos test!'),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: characters.length,
                      itemBuilder: (BuildContext context, int index) {
                        final gameModel = characters[index];
              
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => GameDetailPage(gameModel: gameModel,)),
                            //   );
                            // },
                            child: Row(
                              children: [
                                // Flexible(
                                //   child: ScreenshotImage(
                                //     gameId: gameModel.id,
                                //     width: 140,
                                //   )
                                // ),
                                const SizedBox(width: 8.0,),
                                Expanded(child: Text(characters[index].name))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: 500,
                  child: Center(child: Text('There are no characters here!.'))
                ),
              );
            }
          } else if (state is GetCharacterError) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: Text('There are no characters.'));
          }
        },
      )
    );
  }
}
