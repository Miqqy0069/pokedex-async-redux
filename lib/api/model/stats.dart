import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/stats_info.dart';

part 'pokemon_stats.freezed.dart';

part 'pokemon_stats.g.dart';

@freezed
class Stats with _$PokemonStats {
  const factory Stats({
    @JsonKey(name: 'base_stat') required double baseStat,
    @JsonKey(name: 'stat') required StatsInfo stat,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
