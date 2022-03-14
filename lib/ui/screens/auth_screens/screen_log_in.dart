

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp_common/platform/model_services/user/local_user_service.dart';
import 'package:fmp_common/platform/models/user_service/user_login_result.dart';
import 'package:fmp_common/platform/navigation/base_navigator_service.dart';
import 'package:fmp_common/platform/validator/string_validator.dart';
import 'package:fmp_common/ui/screens/auth_screens/screen_register.dart';
import 'package:fmp_common/ui/widgets/auth_screens/auth_error_text.dart';
import 'package:fmp_common/ui/widgets/buttons/button_icon_text.dart';

class ScreenLogIn extends StatefulWidget {
  const ScreenLogIn({Key? key}) : super(key: key);

  @override
  _ScreenLogInState createState() => _ScreenLogInState();
}

enum LogInState {noRequestSend,waitingForResult}

class _ScreenLogInState extends State<ScreenLogIn> {

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  LogInState _logInState = LogInState.noRequestSend;

  final _formKey = GlobalKey<FormState>();

  UserLoginResultStatus? lastLoginState;

  @override
  void initState() {
    super.initState();
  }

  void _onLoginButtonPressed() async{
    if (_formKey.currentState!.validate()){
      String email = emailTextController.text;
      String password = passwordTextController.text;

      setState(() {
        _logInState = LogInState.waitingForResult;
      });

      UserLoginResult result = await LocalUserService.instance.login(email, password);
      lastLoginState = result.status;

      setState(() {
        // keep loading indicator if successful as screen transition will follow
        if(lastLoginState == UserLoginResultStatus.successful){
          _logInState = LogInState.waitingForResult;
        }else{
          _logInState = LogInState.noRequestSend;
        }
      });

      LocalUserState localUserState = LocalUserService.instance.localUserState;
      if(localUserState != LocalUserState.loggedOut){
        BaseNavigatorService.instance.navigateAccordingToUserState(localUserState);
      }
    }
  }


  void _onSwitchToRegisterPressed() {
    Navigator.of(context).push( MaterialPageRoute(
        builder: (BuildContext context) => const ScreenRegister())
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
            child: Center(

              child: Container(
                constraints: const BoxConstraints(
                    maxWidth: 400
                ),
              child: ListView(
                padding: EdgeInsets.all(32),
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
                      const SizedBox(height: 32,),
                      Text(
                        "Welcome,",
                        style: Theme.of(context).textTheme.headline2
                      ),
                      Text(
                        "Log in to continue.",
                        style: Theme.of(context).textTheme.headline3
                      ),
                      const SizedBox(height: 8,),
                      Row(
                        children:  [
                          const Text(
                            "If you are new / ",
                            style: TextStyle(
                                fontFamily: 'LexendDeca',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              color: Colors.grey

                            ),
                          ),
                          TextButton(
                            onPressed: _onSwitchToRegisterPressed,
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                  fontFamily: 'LexendDeca',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 16
                              ),
                            ),
                            ),

                            ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8,),

                  AuthErrorText(
                      getColor: AuthErrorText.getColorLogIn,
                      getText: AuthErrorText.getTextLogIn,
                      t: lastLoginState
                  ),
                  const SizedBox(height: 8,),

                  TextFormField(
                    controller: emailTextController,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Email'
                    ),
                    validator: StringValidator.validateEmail,

                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: passwordTextController,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                    ),
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: StringValidator.validatePassword,
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    height: 48,
                    child: _buildLoginButton(),
                  ),

                  const SizedBox(height: 8,),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 12
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
    switch(_logInState){
      case LogInState.noRequestSend:
        return ButtonIconText(
          text: "Log in",
          icon: Icons.arrow_forward,
          onPressed: _onLoginButtonPressed,
        );
      case LogInState.waitingForResult:
        return Container(
          height: 40,
          width: 40,
          child: const Center(child: CircularProgressIndicator(color: Colors.black,))
        );
    }
  }


}
