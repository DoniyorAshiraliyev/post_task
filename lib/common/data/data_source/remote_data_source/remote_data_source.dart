import 'package:post_task/core/utils/apis/apis.dart';

abstract class RemoteDataSource {
  Future<Object> methodGet(String api, {int? id, Map<String, String>? param, String baseUrl = Api.baseUrl});
}