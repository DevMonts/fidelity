class EnterpriseModel {
  int enterpriseId;
  String enterpriseName;

  EnterpriseModel({required this.enterpriseId, required this.enterpriseName});

  Map<String, dynamic> toMap() {
    return {'enterpriseId': enterpriseId, 'enterpriseName': enterpriseName};
  }

  factory EnterpriseModel.fromMap(Map<String, dynamic> map) {
    return EnterpriseModel(
      enterpriseId: map['enterpriseId'],
      enterpriseName: map['enterpriseName'],
    );
  }
}
