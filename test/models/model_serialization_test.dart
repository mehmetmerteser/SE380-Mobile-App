import 'package:flutter_test/flutter_test.dart';
import 'package:se380_mobile_app/models/app_user.dart';
import 'package:se380_mobile_app/models/financial_record.dart';
import 'package:se380_mobile_app/models/payment_records.dart';

void main() {
  test('user role survives map serialization', () {
    const user = AppUser(
      id: 'user-1',
      name: 'Yasin Polat',
      email: 'yasin@example.com',
      role: UserRole.admin,
      projectIds: ['project-1'],
    );

    final restored = AppUser.fromMap(user.id, user.toMap());

    expect(restored.role, UserRole.admin);
    expect(restored.isAdmin, isTrue);
    expect(restored.projectIds, ['project-1']);
  });

  test('financial record survives map serialization', () {
    final record = FinancialRecord(
      id: 'record-1',
      projectId: 'project-1',
      title: 'Concrete',
      amount: 185000,
      type: FinancialRecordType.projectCost,
      recordedAt: DateTime.utc(2026, 11, 19),
      createdBy: 'user-1',
    );

    final restored = FinancialRecord.fromMap(record.id, record.toMap());

    expect(restored.amount, 185000);
    expect(restored.type, FinancialRecordType.projectCost);
    expect(restored.recordedAt, DateTime.utc(2026, 11, 19));
  });

  test('worker payment calculates total wage', () {
    final payment = WorkerPayment(
      id: 'payment-1',
      projectId: 'project-1',
      workerId: 'worker-1',
      workerName: 'Test Worker',
      workDays: 5,
      dailyWage: 1500,
      periodStart: DateTime.utc(2026, 11, 1),
      periodEnd: DateTime.utc(2026, 11, 5),
      isPaid: false,
    );

    expect(payment.totalAmount, 7500);
  });
}
