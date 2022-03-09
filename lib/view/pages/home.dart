import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_challenge/core/constants.dart';
import 'package:rick_morty_challenge/core/utils.dart';
import 'package:rick_morty_challenge/view/logic/get_characeter.cubit/get_character_cubit.dart';
import 'package:rick_morty_challenge/view/pages/character_page.dart';
import 'package:rick_morty_challenge/core/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
    print(context.read<GetCharacterCubit>().page);

    return Scaffold(
      key: _scaffoldKey,
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
          } else if (state is GetCharacterLoaded || state is GetCharacterLoading) {
            
            final characters = context.read<GetCharacterCubit>().charsSaved;

            if (characters.isNotEmpty) {
              return SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 16.0,),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 280
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
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 8.0
                            ),
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Utils.getColorFromSpecie(charactModel),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              )
                            ),
                            child: Hero(
                              tag: charactModel.id,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  charactModel.image != null
                                  ? Expanded(
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          charactModel.image!,
                                          fit: BoxFit.fitWidth,
                                          errorBuilder: (_, object, stack) {
                                            return Image.asset(Constants.placeholderUrl);
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                  : const SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name: ' + charactModel.name,
                                          style: TextFontStyle.homeText,
                                        ),
                                        charactModel.species != null || charactModel.type!.isNotEmpty
                                        ? Text(
                                          'Specie: ' + charactModel.species!,
                                          style: TextFontStyle.homeText,
                                        ) : const SizedBox(),
                                        charactModel.gender != null || charactModel.gender!.isNotEmpty
                                        ? Text(
                                          'Gender: ' + charactModel.gender!,
                                          style: TextFontStyle.homeText,
                                        ) : const SizedBox(),
                                        charactModel.type != null || charactModel.type!.isNotEmpty
                                        ? Text(
                                          'Type: ' + charactModel.type!,
                                          style: TextFontStyle.homeText,
                                        )
                                        : const SizedBox(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40.0,),
                    state is GetCharacterLoading
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox(),
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
