import 'package:dartz/dartz.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'package:inky/domain/tags/tag_failure.dart';
import 'meta_data_parser_repository.dart';

class InklingRemoteService {
  final http.Client _client;

  InklingRemoteService(http.Client client) : _client = client;

  Future<Either<TagFailure, MetaData?>> fetchMetaData(String url) async {
    final requestUri = Uri.parse(url);
    MetaData metaData = MetaData();

    try {
      final response = await _client.get(requestUri);
      if (response.statusCode == 200) {
        final document = parse(response.body);
        metaData = MetaDataParser(document).parse();
      }
      return right(metaData);
    } catch (e) {
      return left(TagFailure.unexpected(message: e.toString()));
    }
  }
}
