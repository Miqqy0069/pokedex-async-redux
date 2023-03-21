import 'package:freezed_annotation/freezed_annotation.dart';

part 'moves_info.freezed.dart';

part 'moves_info.g.dart';

@freezed
class MovesInfo with _$MovesInfo {
  const factory MovesInfo({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _MovesInfo;

  factory MovesInfo.fromJson(Map<String, dynamic> json) => _$MovesInfoFromJson(json);
}
