import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/auth/data/repositries/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (err) => emit(SignInError(err.errMessage)),
      (user) => emit(SignInSuccess()),
    );
  }
}
