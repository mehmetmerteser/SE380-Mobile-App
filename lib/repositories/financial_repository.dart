import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/financial_record.dart';
import '../models/payment_records.dart';

abstract interface class FinancialRepository {
  Stream<List<FinancialRecord>> watchRecords(String projectId);

  Future<void> addRecord(FinancialRecord record);

  Future<void> saveSupplierDebt(SupplierDebt debt);

  Future<void> saveWorkerPayment(WorkerPayment payment);
}

class FirestoreFinancialRepository implements FinancialRepository {
  FirestoreFinancialRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _records(String projectId) {
    return _firestore
        .collection('projects')
        .doc(projectId)
        .collection('financialRecords');
  }

  @override
  Stream<List<FinancialRecord>> watchRecords(String projectId) {
    return _records(projectId)
        .orderBy('recordedAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((document) {
            final data = Map<String, Object?>.from(document.data());
            final date = data['recordedAt'];
            if (date is Timestamp) {
              data['recordedAt'] = date.toDate().toIso8601String();
            }
            return FinancialRecord.fromMap(document.id, data);
          }).toList(),
        );
  }

  @override
  Future<void> addRecord(FinancialRecord record) {
    final data = record.toMap();
    data['recordedAt'] = Timestamp.fromDate(record.recordedAt);
    return _records(record.projectId).doc(record.id).set(data);
  }

  @override
  Future<void> saveSupplierDebt(SupplierDebt debt) {
    final data = debt.toMap();
    data['dueDate'] = Timestamp.fromDate(debt.dueDate);
    return _firestore
        .collection('projects')
        .doc(debt.projectId)
        .collection('supplierDebts')
        .doc(debt.id)
        .set(data, SetOptions(merge: true));
  }

  @override
  Future<void> saveWorkerPayment(WorkerPayment payment) {
    final data = payment.toMap();
    data['periodStart'] = Timestamp.fromDate(payment.periodStart);
    data['periodEnd'] = Timestamp.fromDate(payment.periodEnd);
    return _firestore
        .collection('projects')
        .doc(payment.projectId)
        .collection('workerPayments')
        .doc(payment.id)
        .set(data, SetOptions(merge: true));
  }
}
