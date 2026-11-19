import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/app_user.dart';

abstract interface class AuthRepository {
  Stream<User?> get authStateChanges;

  Future<AppUser> signIn({required String email, required String password});

  Future<void> signOut();

  Future<AppUser?> currentProfile();
}

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({FirebaseAuth? auth, FirebaseFirestore? firestore})
    : _auth = auth ?? FirebaseAuth.instance,
      _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  Future<AppUser> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    final user = credential.user;
    if (user == null) {
      throw StateError('Firebase kullanıcı kaydı döndürmedi.');
    }

    final profile = await _firestore.collection('users').doc(user.uid).get();
    if (!profile.exists || profile.data() == null) {
      throw StateError('Kullanıcı profili Firestore içinde bulunamadı.');
    }
    return AppUser.fromMap(profile.id, profile.data()!);
  }

  @override
  Future<AppUser?> currentProfile() async {
    final user = _auth.currentUser;
    if (user == null) return null;
    final profile = await _firestore.collection('users').doc(user.uid).get();
    final data = profile.data();
    return data == null ? null : AppUser.fromMap(profile.id, data);
  }

  @override
  Future<void> signOut() => _auth.signOut();
}
