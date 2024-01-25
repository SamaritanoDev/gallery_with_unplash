import 'package:equatable/equatable.dart';

final class Url extends Equatable {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smalls3;

  const Url({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smalls3,
  });

  @override
  List<Object> get props => [raw, full, regular, small, thumb, smalls3];

  static Url defaultUrl() {
    return const Url(
      raw: 'default_raw_url',
      full: 'default_full_url',
      regular: 'default_regular_url',
      small: 'default_small_url',
      thumb: 'default_thumb_url',
      smalls3: 'default_smalls3_url',
    );
  }
}
