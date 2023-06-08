import 'package:dartz/dartz.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import '../../domain/metadata/meta_data_failure.dart';
import 'meta_data.dart';

class InklingRemoteService {
  final http.Client _client;

  InklingRemoteService(http.Client client) : _client = client;

  Future<Either<MetaDataFailure, MetaData>> fetchMetaData(String url) async {
    final requestUri = Uri.parse(url);
    try {
      final response = await _client.get(requestUri);
      if (response.statusCode == 200) {
        final document = parse(response.body);
        final metaData = MetaData.createFromDocument(document);

        if (metaData.title == null) {
          return left(const MetaDataFailure.missingProperty('og:title'));
        }
        if (metaData.imageUrl == null) {
          return left(const MetaDataFailure.missingProperty('og:image'));
        }
        if (metaData.url == null) {
          return left(const MetaDataFailure.missingProperty('og:url'));
        }

        return right(metaData);
      } else {
        return left(MetaDataFailure.unexpected(
            message:
                'Failed to load URL. Status Code: ${response.statusCode}'));
      }
    } catch (e) {
      return left(MetaDataFailure.unexpected(message: e.toString()));
    }
  }
}
