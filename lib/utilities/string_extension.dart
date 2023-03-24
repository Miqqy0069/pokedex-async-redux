import 'package:pokedex_async_redux/utilities/constants.dart';

extension StringExtension on String {
  String get pokemonId => split('/')[6];
  String get toCustomUrl => imageURL.replaceFirst(indexKey, pokemonId);
}
