import 'package:breaking_bad_api/views/home/cubits/home_controller.dart';
import 'package:breaking_bad_api/views/home/states/home_states.dart';
import 'package:breaking_bad_api/views/home/widget/characters_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCharactersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = HomeController.of(context);
    return BlocBuilder(
      bloc: controller,
      builder: (context, state) => state is HomeLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: controller.charactersList.length,
              itemBuilder: (context, index) {
                final char = controller.charactersList[index];
                return CharactersCard(
                  image: char.image,
                  name: char.name,
                );
              },
            ),
    );
  }
}
