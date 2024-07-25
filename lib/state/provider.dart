// news_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/api/data_class.dart';
import 'package:news_app/api/response.dart';

final newsRepositoryProvider = Provider<Repository>((ref) {
  return Repository();
});

final newsProvider = FutureProvider<NewsRes>((ref) async {
  final repository = ref.watch(newsRepositoryProvider);
  return repository.fetchNews();
});
