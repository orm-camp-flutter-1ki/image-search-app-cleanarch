import 'package:flutter/material.dart';
import 'package:image_search_app_clean/data/repository/image_repository_impl.dart';

import '../../domain/model/image_item.dart';

class MainViewModel extends ChangeNotifier {
  final _repository = ImageRepositoryImpl();

  List<ImageItem> imageItems = [];
  bool isLoading = false;


  Future<void> fetchImages(String query) async {
    isLoading = true;
    notifyListeners();

    imageItems = await _repository.getImageItems(query);
    isLoading = false;
    notifyListeners();
  }
}