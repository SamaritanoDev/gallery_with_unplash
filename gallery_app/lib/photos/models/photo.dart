import 'package:equatable/equatable.dart';
import 'package:gallery_app/photos/models/models.dart';

final class Photo extends Equatable {
  final String id;
  final String slug;
  final Url url;
  final String description;

  const Photo({
    required this.id,
    required this.slug,
    required this.url,
    required this.description,
  });

  @override
  List<Object> get props => [id, url, description];
}
