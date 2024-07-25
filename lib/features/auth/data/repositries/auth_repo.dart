import 'package:breeze_forecast/core/errors/faluire.dart';
import 'package:breeze_forecast/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  Future<Either<Failure, Future<UserModel>>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        return right(Future.value(UserModel(
            email: email,
            password: password,
            name: credential.user!.displayName ?? '')));
      } else {
        return left(FirebaseFailure(errMessage: 'Error while creating user'));
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseAuth(e.code));
    }
  }

  Future<Either<Failure, Future<UserModel>>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        return right(Future.value(UserModel(
            email: email,
            password: password,
            name: credential.user!.displayName ?? '')));
      } else {
        return left(FirebaseFailure(errMessage: 'User not found'));
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseAuth(e.code));
    }
  }
}
