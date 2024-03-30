import '../model/roll.dart';
import '../objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store _store;
  late final Box<Roll> _rollBox;

  ObjectBox._init(this._store){
    _rollBox = Box<Roll>(_store);
  }

  static Future<ObjectBox> init() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: join(docsDir.path, "objectbox"));

    return ObjectBox._init(store);
  }

  Roll? getRoll(int id) => _rollBox.get(id);

  Stream<List<Roll>> getRolls() => _rollBox
    .query()
    .watch(triggerImmediately: true)
    .map((query) => query.find());

  int insertRoll(Roll roll) => _rollBox.put(roll);

}