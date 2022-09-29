import 'package:hive_flutter/hive_flutter.dart';

import 'inkling_dto.dart';

class InklingLocalServices {
  late Box<InklingDto> _inklingDtos;

  Future<void> init() async => _inklingDtos = await Hive.openBox('inklingBox');

  List<InklingDto> fetchInklings() => _inklingDtos.values.toList();

  Future<void> insert(InklingDto dto) async => await _inklingDtos.add(dto);

  Future<void> delete(InklingDto dto) async {
    final dtoToDelete = _inklingDtos.values.firstWhere((e) => e == dto);
    dtoToDelete.delete();
  }
}
