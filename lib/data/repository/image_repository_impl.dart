import 'dart:convert';

import 'package:image_search_app_clean/domain/model/image_item.dart';
import 'package:image_search_app_clean/domain/repository/image_repository.dart';

import 'package:http/http.dart' as http;

class ImageRepositoryImpl implements ImageRepository {

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo'));

    final Iterable imageListJson = jsonDecode(response.body)['hits'];

    return imageListJson.map((e) => ImageItem.fromMap(e)).toList();
  }
}
