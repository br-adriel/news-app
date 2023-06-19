import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';

part 'api_service.g.dart';

class ApiService = _ApiService with _$ApiService;

abstract class _ApiService with Store {
  Dio _dio;

  _ApiService() {
    _dio = Dio(BaseOptions(baseUrl: dotenv.env['API_BASE_URL']));
  }

  @computed
  String get apiKey => dotenv.env['API_KEY'];

  @computed
  String get siteBaseUrl => dotenv.env['SITE_BASE_URL'];

  @action
  Future<List<dynamic>> getPosts(int limit) async {
    try {
      final response = await _dio.get('posts', queryParameters: {'limit': limit});
      return response.data['posts'];
    } catch (error) {
      throw Exception('Failed to fetch posts');
    }
  }

  @action
  Future<List<dynamic>> getPopularPosts(String timeframe) async {
    try {
      final response = await _dio.get('popular/posts', queryParameters: {'timeframe': timeframe});
      return response.data['posts'];
    } catch (error) {
      throw Exception('Failed to fetch popular posts');
    }
  }

  @action
  Future<List<dynamic>> searchPosts(String query) async {
    try {
      final response = await _dio.get('search/posts', queryParameters: {'query': query});
      return response.data['results'];
    } catch (error) {
      throw Exception('Failed to search posts');
    }
  }
}