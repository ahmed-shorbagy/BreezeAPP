import 'dart:developer';

import 'package:breeze_forecast/core/errors/faluire.dart';
import 'package:breeze_forecast/features/auth/data/models/position_model.dart';
import 'package:breeze_forecast/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class AuthRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Either<Failure, Future<UserModel>>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        return right(Future.value(UserModel(
          email: email,
          password: password,
        )));
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
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        return right(Future.value(UserModel(
          email: email,
          password: password,
        )));
      } else {
        return left(FirebaseFailure(errMessage: 'User not found'));
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseAuth(e.code));
    }
  }

  Future<Either<Failure, void>> saveUserLocation({
    required String userId,
    required double latitude,
    required double longitude,
    required String cityName,
  }) async {
    try {
      final userLocationCollection =
          _db.collection('users').doc(userId).collection('locations');
      final cityQuery =
          await userLocationCollection.where('city', isEqualTo: cityName).get();

      if (cityQuery.docs.isEmpty) {
        String formattedTimestamp =
            DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

        await userLocationCollection.add({
          'latitude': latitude,
          'longitude': longitude,
          'city': cityName,
          'timestamp': formattedTimestamp,
        });

        return right(null);
      } else {
        return left(ServerFaliure(errMessage: 'Location already saved.'));
      }
    } catch (e) {
      return left(ServerFaliure(errMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<Position>>> getUserLocations(
      {required String userId}) async {
    try {
      final snapshot = await _db
          .collection('users')
          .doc(userId)
          .collection('locations')
          .get();

      log("${snapshot.docs.map((doc) => Position.fromMap(doc.data())).toList()}");
      return right(
          snapshot.docs.map((doc) => Position.fromMap(doc.data())).toList());
    } catch (e) {
      print("Error fetching locations: $e");
      return left(ServerFaliure(errMessage: e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteLocation(
      {required String userId, required String cityName}) async {
    try {
      await _db
          .collection('users')
          .doc(userId)
          .collection('locations')
          .where('city', isEqualTo: cityName)
          .get()
          .then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          doc.reference.delete();
        }
      });

      return right(null);
    } catch (e) {
      return left(ServerFaliure(errMessage: e.toString()));
    }
  }
}
