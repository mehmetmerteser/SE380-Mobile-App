import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/apartment.dart';
import '../models/construction_project.dart';

abstract interface class ProjectRepository {
  Stream<List<ConstructionProject>> watchProjects(String userId);

  Stream<List<Apartment>> watchApartments(String projectId);

  Future<void> saveApartment(Apartment apartment);
}

class FirestoreProjectRepository implements ProjectRepository {
  FirestoreProjectRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Stream<List<ConstructionProject>> watchProjects(String userId) {
    return _firestore
        .collection('projects')
        .where('memberIds', arrayContains: userId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((document) {
            final data = Map<String, Object?>.from(document.data());
            data['createdAt'] = _dateString(data['createdAt']);
            return ConstructionProject.fromMap(document.id, data);
          }).toList(),
        );
  }

  @override
  Stream<List<Apartment>> watchApartments(String projectId) {
    return _firestore
        .collection('projects')
        .doc(projectId)
        .collection('apartments')
        .orderBy('code')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (document) => Apartment.fromMap(document.id, document.data()),
              )
              .toList(),
        );
  }

  @override
  Future<void> saveApartment(Apartment apartment) {
    return _firestore
        .collection('projects')
        .doc(apartment.projectId)
        .collection('apartments')
        .doc(apartment.id)
        .set(apartment.toMap(), SetOptions(merge: true));
  }

  String _dateString(Object? value) {
    if (value is Timestamp) return value.toDate().toIso8601String();
    if (value is DateTime) return value.toIso8601String();
    return value as String? ?? '';
  }
}
