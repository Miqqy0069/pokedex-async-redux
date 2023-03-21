import 'package:dio/dio.dart';

class ApiClient {
  late Dio dio;

  static const String baseUrl = 'https://pokeapi.co/api/v2';

<<<<<<< HEAD
  ApiClient() {
=======
  ApiClient(){
>>>>>>> 1539966531f205e0de9a6c07cdaa9f7028c7e853
    dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(QueuedInterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onError: (error, handler) => handler.reject(error),
      ));
<<<<<<< HEAD
  }
}
=======

  }
}
>>>>>>> 1539966531f205e0de9a6c07cdaa9f7028c7e853
