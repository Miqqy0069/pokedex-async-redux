import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_info.freezed.dart';

part 'stats_info.g.dart';

@freezed
class StatsInfo with _$StatsInfo {
  const factory StatsInfo({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _StatsInfo;

  factory StatsInfo.fromJson(Map<String, dynamic> json) => _$StatsInfoFromJson(json);
}
