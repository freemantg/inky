import 'package:hive_flutter/hive_flutter.dart';
import 'package:inky/infrastructure/inklings/inkling_dto.dart';
import 'package:inky/infrastructure/tags/tag_dto.dart';

class HiveDatabase {
  Future<void> init() async {
    //Initializes Hive with the path from [getApplicationDocumentsDirectory].
    await Hive.initFlutter();
    //Registering TypeAdapters
    Hive.registerAdapter(TagDtoAdapter());
    Hive.registerAdapter(InklingDtoAdapter());
  }
}
