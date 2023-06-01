import 'package:hive_flutter/hive_flutter.dart';

import '../inklings/inkling_dto.dart';
import '../tags/tag_dto.dart';

class HiveDatabase {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(InklingDtoAdapter());
    Hive.registerAdapter(TagDtoAdapter());
    // register hive adapters here...
  }
}
