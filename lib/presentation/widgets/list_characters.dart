import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';
import 'package:marvelapp_flutter/presentation/navigation/app_routes.dart';
import 'package:marvelapp_flutter/presentation/widgets/bottom_error.dart';
import 'package:marvelapp_flutter/presentation/widgets/bottom_loader.dart';
import 'package:marvelapp_flutter/presentation/widgets/empty_widget.dart';

class ListCharacters extends StatefulWidget {
  final List<CharacterViewData>? list;
  final String? error;
  final bool hasReachedMax;

  const ListCharacters({Key? key, required this.list, this.error, this.hasReachedMax = false}) : super(key: key);

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
    List<CharacterViewData> characters = widget.list ?? List.empty();
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListView.builder(
        itemCount: widget.hasReachedMax ? characters.length : characters.length + 1,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          Widget errorOrLoader;
          if (widget.error == null && !widget.hasReachedMax) {
            errorOrLoader = const BottomLoader();
          } else if (widget.error == null && widget.hasReachedMax) {
            errorOrLoader = const EmptyWidget();
          } else {
            errorOrLoader = const BottomError();
          }
          final isLastItem = index == characters.length;
          return isLastItem ? errorOrLoader : getHeroCard(characters[index]);
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<HomeBloc>().add(GetHeroes());
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
            SizedBox(
              width: 220,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  character.name ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ],
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
