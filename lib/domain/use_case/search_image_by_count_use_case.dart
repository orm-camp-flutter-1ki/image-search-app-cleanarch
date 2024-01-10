import 'package:image_search_app_clean/domain/model/image_item.dart';

import '../../data/repository/image_repository_impl.dart';

class SearchImageByCountUseCase {
  final _repository = ImageRepositoryImpl();

  Future<List<ImageItem>> execute(String query, {int? count}) async {
    if (count != null) {
      return (await _repository.getImageItems(query)).take(count).toList();
    }
    return await _repository.getImageItems(query);
  }
}
