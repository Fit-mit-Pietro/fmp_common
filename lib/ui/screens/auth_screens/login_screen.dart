import 'package:flutter/material.dart';
import 'package:fmp_common/platform/model_services/user/local_user_service.dart';
import 'package:fmp_common/platform/models/user_service/user_login_result.dart';
import 'package:fmp_common/platform/navigation/user_state_navigation_service.dart';
import 'package:fmp_common/platform/validator/string_validator.dart';
import 'package:fmp_common/ui/screens/auth_screens/screen_register.dart';
import 'package:fmp_common/ui/widgets/auth_screens/auth_error_text.dart';
import 'package:fmp_common/ui/widgets/buttons/button_icon_text.dart';

enum LogInState {
  noRequestSend,
  waitingForResult,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  LogInState _logInState = LogInState.noRequestSend;

  final _formKey = GlobalKey<FormState>();

  UserLoginResultStatus? lastLoginState;

  @override
  void initState() {
    super.initState();
  }

  void _onLoginButtonPressed() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    String email = emailTextController.text.trim();
    String password = passwordTextController.text;

    setState(() {
      _logInState = LogInState.waitingForResult;
    });

    UserLoginResult result =
        await LocalUserService.instance.login(email, password);
    lastLoginState = result.status;

    setState(() {
      // keep loading indicator if successful as screen transition will follow
      if (lastLoginState == UserLoginResultStatus.successful) {
        _logInState = LogInState.waitingForResult;
      } else {
        _logInState = LogInState.noRequestSend;
      }
    });

    LocalUserState localUserState = LocalUserService.instance.localUserState;
    if (localUserState != LocalUserState.loggedOut) {
      // wait for log in successfull message
      await Future.delayed(const Duration(seconds: 1));
      UserStateNavigationService.instance
          .navigateAccordingToUserState(localUserState);
    }
  }

  void _onSwitchToRegisterPressed() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => const ScreenRegister()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ListView(
                padding: const EdgeInsets.all(32),
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Image(
                          image: AssetImage('assets/img/fmp_logo.png'),
                          height: 80,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text("Willkommen,",
                          style: Theme.of(context).textTheme.displayMedium),
                      Text("Bitte melden Sie sich an.",
                          style: Theme.of(context).textTheme.displaySmall),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Sie sind neu? / ",
                            style: TextStyle(
                              fontFamily: 'LexendDeca',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: _onSwitchToRegisterPressed,
                            child: const Text(
                              "Profil anlegen",
                              style: TextStyle(
                                  fontFamily: 'LexendDeca',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AuthErrorText(
                      getColor: AuthErrorText.getColorLogIn,
                      getText: AuthErrorText.getTextLogIn,
                      t: lastLoginState),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: emailTextController,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: StringValidator.validateEmail,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: passwordTextController,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                    ),
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Passwort',
                    ),
                    validator: StringValidator.validatePassword,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: _buildLoginButton(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      "Passwort vergessen?",
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    switch (_logInState) {
      case LogInState.noRequestSend:
        return ButtonIconText(
          text: "Log in",
          icon: Icons.arrow_forward,
          onPressed: _onLoginButtonPressed,
        );
      case LogInState.waitingForResult:
        return const SizedBox(
            height: 40,
            width: 40,
            child: Center(child: CircularProgressIndicator()));
    }
  }
}
