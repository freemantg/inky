import 'package:dartz/dartz.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'package:inky/domain/tags/tag_failure.dart';
import 'meta_data_parser_repository.dart';

class InklingRemoteService {
  final http.Client _client;

  InklingRemoteService(http.Client client) : _client = client;

  Future<Either<InklingFailure, MetaData?>> fetchMetaData(String url) async {
    final requestUri = Uri.parse(url);

    try {
      final response = await _client.get(requestUri);
      if (response.statusCode == 200) {
        final document = parse(response.body);
        final metaData = MetaDataParser(document).parse();
        return right(metaData);
      } else {
        throw Exception();
      }
    } catch (e) {
      return left(const InklingFailure.unexpected());
    }
  }
}
