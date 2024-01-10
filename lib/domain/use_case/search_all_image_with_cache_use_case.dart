import '../../data/repository/image_repository_impl.dart';
import '../model/image_item.dart';

class SearchAllImageWithCacheUseCase {
  final _repository = ImageRepositoryImpl();

  final Map<String, List<ImageItem>> _cache = {};

  Future<List<ImageItem>> execute(String query) async {
    if (_cache.containsKey(query)) {
      return _cache[query]!;
    }

    final result = await _repository.getImageItems(query);
    _cache[query] = result;
    return result;
  }
}