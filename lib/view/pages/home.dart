import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_challenge/core/constants.dart';
import 'package:rick_morty_challenge/view/logic/get_characeter.cubit/get_character_cubit.dart';
import 'package:rick_morty_challenge/view/pages/character_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          context.read<GetCharacterCubit>().getCharacters(scroll: true);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Layos test'),
      ),
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
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCharacterLoaded) {
            final characters = state.characters;
            if (characters.isNotEmpty) {
              return SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    GridView.builder(
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: characters.length,
                      itemBuilder: (BuildContext context, int index) {
                        final charactModel = characters[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetailPage(
                                  character: charactModel,
                                )),
                            );
                          },
                          child: Hero(
                            tag: charactModel.id,
                            child: Column(
                              children: [
                              charactModel.image != null
                              ? Expanded(
                                  child: Image.network(
                                    charactModel.image!,
                                    width: 60,
                                    height: 60,
                                    errorBuilder: (_, object, stack) {
                                      return Image.asset(Constants.placeholderUrl);
                                    },
                                  ),
                                )
                              : const SizedBox(
                                  width: 60.0,
                                  height: 60.0,
                                ),
                              const SizedBox(width: 8.0,),
                              Flexible(
                                child: Text('Name: ' + charactModel.name)),
                              charactModel.type != null
                              ? Flexible(
                                child: Text('Type: ' + charactModel.type!))
                              : const SizedBox(),
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
                    child: Center(
                        child: Text('There are no characters here!.'))),
              );
            }
          } else if (state is GetCharacterError) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: Text('There are no characters.'));
          }
        },
      ));
  }
}
