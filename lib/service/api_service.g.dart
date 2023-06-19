// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApiService on _ApiService, Store {
  Computed<String>? _$apiKeyComputed;

  @override
  String get apiKey => (_$apiKeyComputed ??=
          Computed<String>(() => super.apiKey, name: '_ApiService.apiKey'))
      .value;
  Computed<String>? _$siteBaseUrlComputed;

  @override
  String get siteBaseUrl =>
      (_$siteBaseUrlComputed ??= Computed<String>(() => super.siteBaseUrl,
              name: '_ApiService.siteBaseUrl'))
          .value;

  late final _$getPostsAsyncAction =
      AsyncAction('_ApiService.getPosts', context: context);

  @override
  Future<List<dynamic>> getPosts(int limit) {
    return _$getPostsAsyncAction.run(() => super.getPosts(limit));
  }

  late final _$getPopularPostsAsyncAction =
      AsyncAction('_ApiService.getPopularPosts', context: context);

  @override
  Future<List<dynamic>> getPopularPosts(String timeframe) {
    return _$getPopularPostsAsyncAction
        .run(() => super.getPopularPosts(timeframe));
  }

  late final _$searchPostsAsyncAction =
      AsyncAction('_ApiService.searchPosts', context: context);

  @override
  Future<List<dynamic>> searchPosts(String query) {
    return _$searchPostsAsyncAction.run(() => super.searchPosts(query));
  }

  @override
  String toString() {
    return '''
apiKey: ${apiKey},
siteBaseUrl: ${siteBaseUrl}
    ''';
  }
}
