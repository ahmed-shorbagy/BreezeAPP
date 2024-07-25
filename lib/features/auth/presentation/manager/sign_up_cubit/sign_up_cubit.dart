import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/auth/data/repositries/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (err) => emit(SignUpError(err.errMessage)),
      (success) => emit(SignUpSuccess()),
    );
  }
}
