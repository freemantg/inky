import 'package:hive_flutter/hive_flutter.dart';

import '../inklings/inkling_dto.dart';
import '../tags/tag_dto.dart';

class HiveDatabase {
  static Future<Map<String, Box>> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(InklingDtoAdapter());
    Hive.registerAdapter(TagDtoAdapter());
    // register hive adapters here...

    // open and return the boxes
    return {
      'inklingDtos': await Hive.openBox<InklingDto>('inklingDtos'),
      'tagDtos': await Hive.openBox<TagDto>('tagDtos'),
    };
  }
}
