enum FinancialRecordType {
  projectCost,
  supplierPayment,
  workerWage;

  static FinancialRecordType fromValue(String? value) {
    return FinancialRecordType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => FinancialRecordType.projectCost,
    );
  }
}

class FinancialRecord {
  const FinancialRecord({
    required this.id,
    required this.projectId,
    required this.title,
    required this.amount,
    required this.type,
    required this.recordedAt,
    required this.createdBy,
    this.apartmentId,
    this.notes,
  });

  final String id;
  final String projectId;
  final String? apartmentId;
  final String title;
  final double amount;
  final FinancialRecordType type;
  final DateTime recordedAt;
  final String createdBy;
  final String? notes;

  factory FinancialRecord.fromMap(String id, Map<String, Object?> map) {
    return FinancialRecord(
      id: id,
      projectId: map['projectId'] as String? ?? '',
      apartmentId: map['apartmentId'] as String?,
      title: map['title'] as String? ?? '',
      amount: (map['amount'] as num?)?.toDouble() ?? 0,
      type: FinancialRecordType.fromValue(map['type'] as String?),
      recordedAt:
          DateTime.tryParse(map['recordedAt'] as String? ?? '') ??
          DateTime(1970),
      createdBy: map['createdBy'] as String? ?? '',
      notes: map['notes'] as String?,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'projectId': projectId,
      'apartmentId': apartmentId,
      'title': title,
      'amount': amount,
      'type': type.name,
      'recordedAt': recordedAt.toIso8601String(),
      'createdBy': createdBy,
      'notes': notes,
    };
  }
}
