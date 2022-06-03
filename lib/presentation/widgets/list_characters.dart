import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_state.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';
import 'package:marvelapp_flutter/presentation/navigation/app_routes.dart';
import 'package:marvelapp_flutter/presentation/widgets/bottom_error.dart';
import 'package:marvelapp_flutter/presentation/widgets/bottom_loader.dart';
import 'package:marvelapp_flutter/presentation/widgets/empty_widget.dart';
import 'package:marvelapp_flutter/presentation/widgets/page_error.dart';

import 'center_loader.dart';

class ListCharacters extends StatefulWidget {
  const ListCharacters({Key? key}) : super(key: key);

  @override
  State<ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        Widget listViewBuilder = _getListViewBuilder(state.characters, state.hasReachedMax, state.loading, state.error);
        if (state.loading) {
          return state.characters.isEmpty ? const CenterLoader() : listViewBuilder;
        }
        if (state.error != null) {
          Widget errorWidget = PageError(
            onRetry: () {
              context.read<HomeBloc>().add(ReadyForData());
            },
          );
          return state.characters.isEmpty ? errorWidget : listViewBuilder;
        }
        return listViewBuilder;
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  //TODO Кандидат в отдельный виджет вместо того чтобы быть методом
  //TODO в этом виджете методе не должно быть параметра loading
  Widget _getListViewBuilder(List<CharacterViewData> characters, bool hasReachedMax, bool loading, String? error) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListView.builder(
        itemCount: hasReachedMax ? characters.length : characters.length + 1,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          Widget errorOrLoader = const EmptyWidget();
          if (loading) {
            errorOrLoader = const BottomLoader();
          }
          if (hasReachedMax) {
            errorOrLoader = const EmptyWidget();
          }
          if (error != null) {
            errorOrLoader = const BottomError();
          }
          final isLastItem = index == characters.length;
          return isLastItem ? errorOrLoader : getHeroCard(characters[index]);
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<HomeBloc>().add(ScrolledToEnd());
  }

  Widget getHeroCard(CharacterViewData character) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.detailScreen, arguments: character.id);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
              ),
              child: _getHeroImage(character),
            ),
            _getNameBlock(character),
          ],
        ),
      ),
    );
  }

  Widget _getNameBlock(CharacterViewData character) {
    return SizedBox(
      width: 180,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          character.name ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
    );
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Widget _getHeroImage(CharacterViewData item) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/graphics/placeholder-150x150.png',
      image: item.thumbnailUrl ?? "",
      imageErrorBuilder: (_, __, ___) {
        return const SizedBox(
          child: Icon(
            Icons.broken_image,
            size: 80,
            color: Colors.grey,
          ),
          height: 100.0,
          width: 100.0,
        );
      },
      height: 100.0,
      width: 100.0,
      fit: BoxFit.fill,
    );
  }
}
