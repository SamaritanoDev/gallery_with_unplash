import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/photos/bloc/photo_bloc.dart';
import 'package:gallery_app/photos/views/widgets.dart';

class PhotosList extends StatefulWidget {
  const PhotosList({
    super.key,
  });

  @override
  State<PhotosList> createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  final _scrollController = ScrollController();
  bool showDetailView = false;

  void toggleDetailView() {
    setState(() {
      showDetailView = !showDetailView;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        switch (state.status) {
          case PhotoStatus.failure:
            return Center(
              child: Text(
                'failed to fetch posts',
                style: TextStyle(color: color.error),
              ),
            );
          case PhotoStatus.success:
            if (state.photos.isEmpty) {
              return Center(
                child: Text(
                  'no photos',
                  style: TextStyle(color: color.error),
                ),
              );
            }
            return GridView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.photos.length
                    ? const BottomLoader()
                    : GestureDetector(
                        child: PhotoListItem(
                          photo: state.photos[index],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return PhotosDetail(
                                urlPhoto: state.photos[index].url.raw,
                              );
                            }),
                          );
                        },
                      );
              },
              itemCount: state.hasReachedMax
                  ? state.photos.length
                  : state.photos.length + 1,
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            );
          case PhotoStatus.initial:
            return Center(
                child: CircularProgressIndicator(
              color: color.tertiary,
            ));
        }
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

  void _onScroll() {
    if (_isBottom) context.read<PhotoBloc>().add(PhotoFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
