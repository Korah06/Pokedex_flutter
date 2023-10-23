import 'package:dio/dio.dart';

abstract class IDioRepository {
  static const String baseUri = "https://pokeapi.co/api/v2/";
  // static final BaseOptions options = BaseOptions(baseUrl: "https://pokeapi.co/api/v2/");
  static final Dio dioClient = Dio()..options.baseUrl = baseUri;
  Dio get dio  => dioClient;
  // final Dio dioClient = Dio(options);
}
