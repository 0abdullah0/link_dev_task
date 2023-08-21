// ignore_for_file: only_throw_errors

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:link_dev_task/app/data/helpers/failure.dart';

class HttpClientService {
  Future<Type> request<Type>({
    required String apiUrl,
    required Map<String, dynamic> parameters,
    required Type Function(http.Response) mapper,
  }) async {
    try {
      final url = Uri.https(apiUrl, '/v1/articles', parameters);
      final response = await http.get(url);
      return mapper.call(response);
    } on SocketException {
      throw const Failure('No Internet Connection 😕');
    } on HttpException {
      throw const Failure("Couldn't find news 😰");
    } on FormatException {
      throw const Failure('Bad response format 👎');
    }
  }
}
