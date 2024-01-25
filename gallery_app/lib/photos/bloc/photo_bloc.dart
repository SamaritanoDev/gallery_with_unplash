import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery_app/photos/enviroments.dart';
import 'package:gallery_app/photos/models/models.dart';

import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'photo_event.dart';
part 'photo_state.dart';

const _photoCount = 30;
const throttleDuration = Duration(milliseconds: 10);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final http.Client httpClient;

  PhotoBloc({required this.httpClient}) : super(const PhotoState()) {
    on<PhotoFetched>(
      _onPhotoFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onPhotoFetched(
      PhotoFetched event, Emitter<PhotoState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PhotoStatus.initial) {
        final photos = await _fetchPhotos();

        return emit(
          state.copyWith(
            status: PhotoStatus.success,
            photos: photos,
            hasReachedMax: false,
          ),
        );
      }

      final photos = await _fetchPhotos();

      photos.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PhotoStatus.success,
                photos: List.of(state.photos)..addAll(photos),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PhotoStatus.failure));
    }
  }

  Future<List<Photo>> _fetchPhotos() async {
    final response = await httpClient.get(
      Uri.https(
        'api.unsplash.com',
        '/photos/random',
        <String, String>{
          'count': _photoCount.toString(),
          'client_id': valueApiKey
        },
      ),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;

      print('Response from Unsplash: $body');

      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;

        return Photo(
          id: map['id'] as String? ?? 'Unknown ID',
          slug: map['slug'] as String? ?? 'No Slug',
          description: map['description'] as String? ?? 'No Description',
          url: _parseUrl(map['urls'] as Map<String, dynamic>),
        );
      }).toList();
    }
    throw Exception('error fetching photos');
  }

  Url _parseUrl(Map<String, dynamic>? urlMap) {
    if (urlMap == null) {
      return const Url(
          raw: 'raw',
          full: 'full',
          regular: 'regular',
          small: 'small',
          thumb: 'thumb',
          smalls3: 'smalls3');
    }
    return Url(
      raw: urlMap['raw'] as String? ?? 'No URL',
      full: urlMap['full'] as String? ?? 'No URL',
      regular: urlMap['regular'] as String? ?? 'No URL',
      small: urlMap['small'] as String? ?? 'No URL',
      thumb: urlMap['thumb'] as String? ?? 'No URL',
      smalls3: urlMap['small_s3'] as String? ?? 'No URL',
    );
  }
}
