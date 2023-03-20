import 'package:pokedex_async_redux/api/api_client.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/utilities/string_constants.dart';

typedef Json = Map<String, dynamic>;

class PokemonApi {
  PokemonApi({
    required this.apiClient,
    required this.baseUri,
  });

  final ApiClient apiClient;
  final Uri baseUri;

  Future<List<Pokemon>> getPokemonList({
    required String offset,
    required String limit,
  }) async {
    final queryParameters = <String, dynamic>{};

    queryParameters[queryParamLimit] = limit;
    queryParameters[queryParamOffset] = offset;

    final uri = baseUri.replace(
        queryParameters: queryParameters, path: '${baseUri.path}$endPointPokemon');
    return await apiClient.dio.getUri(uri).then((response) {
      return response.data[responseDataResult]
          .map<Pokemon>((dynamic data) => Pokemon.fromJson(data as Json))
          .toList();
    });
  }
}
