import 'package:image_search_app_clean/domain/debounce.dart';

import '../model/image_item.dart';
import 'search_all_image_use_case.dart';
import 'search_all_image_with_cache_use_case.dart';

class SearchAllImageWithDebounceUseCase {
  final _searchAllImageWithCacheUseCase = SearchAllImageWithCacheUseCase();
  final _searchAllImageUseCase = SearchAllImageUseCase();
  final _debounce = Debounce(const Duration(milliseconds: 500));

  Future<List<ImageItem>> execute(String query) async {
    // 쿵짝쿵짝 하다보면 될 지도 모르지만 이렇게 안 하는 것이 정신건강에 좋다.
    // 디바운스는 UI에 맞겨라
    _debounce.onEvent(() {

    });
    if (_debounce.timer?.isActive ?? false) {
      return await _searchAllImageWithCacheUseCase.execute(query);
    }
    return _searchAllImageUseCase.execute(query);
  }
}
