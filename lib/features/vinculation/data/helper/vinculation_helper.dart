import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:fidelity_app/features/vinculation/data/model/vinculation_model.dart';

class VinculationHelper {
  Future<int> createVinculation(Map<String, dynamic> vinculation) async {
    final db = await DbHelper.instance.db;
    return await db.insert('vinculations', vinculation);
  }
  Future<List<VinculationModel>> showVinculations() async {
    final db = await DbHelper.instance.db;
    var data = await db.query('vinculations');
    return data
        .map((vinculation) => VinculationModel.mapToObject(vinculation))
        .toList();
  }

  //TODO: Delete

  Future<bool> vinculationExists(int userId, int enterpriseId) async {
    final db = await DbHelper.instance.db;
    final query = await db.query(
      'vinculations',
      where: 'userId = ? AND enterpriseId = ?',
      whereArgs: [userId, enterpriseId],
    );
    return query.isNotEmpty;
  }
}