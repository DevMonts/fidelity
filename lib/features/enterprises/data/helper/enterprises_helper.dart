import 'package:fidelity_app/common/helpers/db_helper.dart';
import 'package:fidelity_app/features/enterprises/data/model/enterprise_model.dart';

class EnterprisesHelper {

  Future<int> createEnterprise(Map<String, dynamic> enterprise) async {
    final db = await DbHelper.instance.db;
    return await db.insert('enterprises', enterprise);
  }

  Future<List<EnterpriseModel>> showEnterprises() async {
    final db = await DbHelper.instance.db;
    var data = await db.query('enterprises');
    return data
        .map((enterprise) => EnterpriseModel.mapToObject(enterprise))
        .toList();
  }

  //TODO: Delete

  Future<bool> enterpriseExists(String enterpriseName) async {
    final db = await DbHelper.instance.db;
    final query = await db.query(
      'enterprises',
      where: 'enterpriseName = ?',
      whereArgs: [enterpriseName],
    );
    return query.isNotEmpty;
  }
}
