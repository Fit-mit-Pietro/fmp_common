

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp_common/platform/model_services/user/local_user_service.dart';
import 'package:fmp_common/platform/models/user_service/user.dart';
import 'package:fmp_common/platform/models/user_service/user_register_result.dart';
import 'package:fmp_common/platform/navigation/user_state_navigation_service.dart';
import 'package:fmp_common/platform/validator/string_validator.dart';
import 'package:fmp_common/ui/screens/auth_screens/screen_log_in.dart';
import 'package:fmp_common/ui/widgets/auth_screens/auth_error_text.dart';
import 'package:fmp_common/ui/widgets/buttons/button_icon_text.dart';


class ScreenRegister extends StatefulWidget {
  const ScreenRegister({Key? key}) : super(key: key);

  @override
  _ScreenRegisterState createState() => _ScreenRegisterState();
}

enum RegisterState {noRequestSend,waitingForResult}

class _ScreenRegisterState extends State<ScreenRegister> {

  TextEditingController emailTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();

  RegisterState _logInState = RegisterState.noRequestSend;

  final _formKey = GlobalKey<FormState>();

  UserRegisterResultStatus? lastRegisterState;

  @override
  void initState() {
    super.initState();
  }

  void _onRegisterButtonPressed() async{
    if (_formKey.currentState!.validate()){
      String password = passwordTextController.text;

      setState(() {
        _logInState = RegisterState.waitingForResult;
      });

      User user = User(
          familyName: lastNameTextController.text.trim(),
          email: emailTextController.text.trim(),
          firstName: firstNameTextController.text.trim(),
          username: usernameTextController.text.trim()
      );

      UserRegisterResult result = await LocalUserService.instance.register(user,password);
      lastRegisterState = result.status;

      setState(() {
        // keep loading indicator if successful as screen transition will follow
        if(lastRegisterState == UserRegisterResultStatus.successful){
          _logInState = RegisterState.waitingForResult;
          Future.delayed(Duration(seconds: 1));
          UserStateNavigationService.instance.navigateAccordingToUserState(LocalUserService.instance.localUserState);
        }else{
          _logInState = RegisterState.noRequestSend;
        }
      });
    }
  }


  void _onSwitchToLoginPressed() {
    Navigator.of(context).push( MaterialPageRoute(
        builder: (BuildContext context) => const ScreenLogIn())
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
                          "Willkommen,",
                          style: Theme.of(context).textTheme.headline2
                      ),
                      Text(
                          "Profil erstellen.",
                          style: Theme.of(context).textTheme.headline3
                      ),
                      const SizedBox(height: 8,),
                      Row(
                        children:  [
                          const Text(
                            "Sie haben ein Profil? / ",
                            style: TextStyle(
                                fontFamily: 'LexendDeca',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey

                            ),
                          ),
                          TextButton(
                            onPressed: _onSwitchToLoginPressed,
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                  fontFamily: 'LexendDeca',
                                  fontWeight: FontWeight.w400,
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
                      getColor: AuthErrorText.getColorRegister,
                      getText: AuthErrorText.getTextRegister,
                      t: lastRegisterState
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
                    controller: usernameTextController,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                        hintText: 'Benutzername'
                    ),
                    validator: StringValidator.validateUsername,

                  ),
                  const SizedBox(height: 16,),
                  Row(children: [
                    Expanded(
                      child: TextFormField(
                        controller: firstNameTextController,
                        style: const TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                            hintText: 'Vorname'
                        ),
                        validator: StringValidator.validateFirstName,

                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: TextFormField(
                        controller: lastNameTextController,
                        style: const TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                            hintText: 'Nachname'
                        ),
                        validator: StringValidator.validateLastName,

                      ),
                    ),
                  ],),
                  const SizedBox(height: 16,),

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
                  const SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    height: 48,
                    child: _buildLoginButton(),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      "Passwort vergessen?",
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
      case RegisterState.noRequestSend:
        return ButtonIconText(
          text: "Konto erstellen",
          icon: Icons.arrow_forward,
          onPressed: _onRegisterButtonPressed,
        );
      case RegisterState.waitingForResult:
        return Container(
            height: 40,
            width: 40,
            child: Center(child: CircularProgressIndicator(color: Colors.black,))
        );
    }
  }



}
