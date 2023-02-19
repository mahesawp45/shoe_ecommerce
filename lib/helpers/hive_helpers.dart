import 'package:hive/hive.dart';

class HiveHelpers {
  static saveData({required String key, required String data}) {
    var box = Hive.box(key);
    box.put(key, data);
  }

  static getData({required String key}) {
    var box = Hive.box(key);
    return box.get(key);
  }

  static deleteData({required String key}) {
    var box = Hive.box(key);
    box.clear();
  }

  static updateData({required String key, required String data}) {
    var box = Hive.box(key);
    box.put(key, data);
  }
}
