import 'package:image_search_app_clean/domain/model/image_item.dart';

import '../../data/repository/image_repository_impl.dart';

class SearchAllImageUseCase {
  final _repository = ImageRepositoryImpl();

  Future<List<ImageItem>> execute(String query) async {
    return await _repository.getImageItems(query);
  }
}