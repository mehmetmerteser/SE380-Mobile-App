class SupplierDebt {
  const SupplierDebt({
    required this.id,
    required this.projectId,
    required this.supplierName,
    required this.totalAmount,
    required this.paidAmount,
    required this.dueDate,
  });

  final String id;
  final String projectId;
  final String supplierName;
  final double totalAmount;
  final double paidAmount;
  final DateTime dueDate;

  double get remainingAmount => totalAmount - paidAmount;

  Map<String, Object?> toMap() => {
    'projectId': projectId,
    'supplierName': supplierName,
    'totalAmount': totalAmount,
    'paidAmount': paidAmount,
    'dueDate': dueDate.toIso8601String(),
  };
}

class WorkerPayment {
  const WorkerPayment({
    required this.id,
    required this.projectId,
    required this.workerId,
    required this.workerName,
    required this.workDays,
    required this.dailyWage,
    required this.periodStart,
    required this.periodEnd,
    required this.isPaid,
  });

  final String id;
  final String projectId;
  final String workerId;
  final String workerName;
  final int workDays;
  final double dailyWage;
  final DateTime periodStart;
  final DateTime periodEnd;
  final bool isPaid;

  double get totalAmount => workDays * dailyWage;

  Map<String, Object?> toMap() => {
    'projectId': projectId,
    'workerId': workerId,
    'workerName': workerName,
    'workDays': workDays,
    'dailyWage': dailyWage,
    'periodStart': periodStart.toIso8601String(),
    'periodEnd': periodEnd.toIso8601String(),
    'isPaid': isPaid,
  };
}
