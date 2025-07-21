class VinculationModel {
  final int vinculationId;
  final int userId;
  final int enterpriseId;
  VinculationModel({
    required this.vinculationId,
    required this.userId,
    required this.enterpriseId,
  });
  factory VinculationModel.mapToObject(Map<String, dynamic> map) {
    return VinculationModel(
      vinculationId: map['vinculationId'] as int,
      userId: map['userId'] as int,
      enterpriseId: map['enterpriseId'] as int,
    );
  }
}
