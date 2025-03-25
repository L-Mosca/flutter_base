import 'package:flutter_base_project/base/state_management/base_bloc.dart';
import 'package:flutter_base_project/domain/helpers/login/login_validator_helper.dart';
import 'package:flutter_base_project/domain/helpers/login/login_validator_helper_impl.dart';
import 'package:flutter_base_project/domain/repositories/user_repository.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_event.dart';
import 'package:flutter_base_project/ui/screens/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final LoginValidatorHelper loginValidatorHelper;

  LoginBloc({
    required this.userRepository,
    required this.loginValidatorHelper,
  }) : super(const LoginState()) {
    on<LoginInitEvent>(_init);
    on<LoginUpdateEmailEvent>(_updateEmail);
    on<LoginUpdatePasswordEvent>(_updatePassword);
    on<LoginSignInEvent>(_signIn);
    on<LoginFetchUserEvent>(_fetchGenericUser);
    on<LoginResetListenerEvent>(_resetListener);
  }

  void _init(LoginInitEvent event, Emitter<LoginState> emitter) async {
    await defaultLaunch(
      function: () async {},
      exceptionHandler: (exception) {},
    );
  }

  void _updateEmail(
    LoginUpdateEmailEvent event,
    Emitter<LoginState> emitter,
  ) async {
    emitter(state.updateEmail(event.email));
  }

  void _updatePassword(
    LoginUpdatePasswordEvent event,
    Emitter<LoginState> emitter,
  ) async {
    emitter(state.updatePassword(event.password));
  }

  void _signIn(LoginSignInEvent event, Emitter<LoginState> emitter) async {
    await defaultLaunch(
      function: () async {
        final username = state.username;
        final password = state.password;

        // Check login form errors
        final errorCode = loginValidatorHelper.checkLoginFields(
          username: username,
          password: password,
        );

        if (errorCode == null) {
          // Do Login
          await userRepository.login(username: username, password: password);
          emitter(state.loginSuccess);
        } else {
          // Show error message
          emitter(_showFieldError(errorCode: errorCode));
        }
      },
      loadingStatus: (isLoading) => emitter(state.isLoading(isLoading)),
      exceptionHandler: (exception) => emitter(state.loginError),
    );
  }

  void _fetchGenericUser(
    LoginFetchUserEvent event,
    Emitter<LoginState> emitter,
  ) async {
    await defaultLaunch(
      loadingStatus: (isLoading) => emitter(state.isLoading(isLoading)),
      function: () async {
        final user = await userRepository.getGenericUser();
        emitter(state.updateCredentials(user.username, user.password));
      },
      exceptionHandler: (exception) {
        emitter(state.copyWith(listener: LoginListener.loginError));
      },
    );
  }

  void _resetListener(
    LoginResetListenerEvent event,
    Emitter<LoginState> emitter,
  ) async {
    emitter(state.resetListener);
  }

  /// Check login form error code and return new LoginState (show invalid username or invalid password error)
  ///
  /// [errorCode] Check login form error code to launch an error message
  ///
  /// [LoginState] return new Login state with correct error
  LoginState _showFieldError({required int errorCode}) {
    if (errorCode == LoginValidatorHelperImpl.emptyUsername) {
      return state.invalidUsername;
    } else {
      return state.invalidPassword;
    }
  }
}
