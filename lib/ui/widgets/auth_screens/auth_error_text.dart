
import 'package:flutter/material.dart';
import 'package:fmp_common/platform/models/user_service/user_login_result.dart';
import 'package:fmp_common/platform/models/user_service/user_register_result.dart';

class AuthErrorText<T> extends StatelessWidget {

  static String getTextLogIn(UserLoginResultStatus? loginResultStatus){
    switch(loginResultStatus){
      case UserLoginResultStatus.successful:
        return "log in successful";
      case UserLoginResultStatus.userNotFound:
        return "email or password not correct";
      case UserLoginResultStatus.userCorrupted:
        return "email or password not correct";
      case UserLoginResultStatus.wrongPassword:
        return "email or password not correct";
      case UserLoginResultStatus.timeout:
        return "Unable to connect to the server";
      case UserLoginResultStatus.unknownError:
        return "unknown error";
      case UserLoginResultStatus.unableToReachServer:
        return "unable to reach server";
      case null:
        return "";
    }
  }

  static String getTextRegister(UserRegisterResultStatus? userRegisterResultStatus ){
    switch(userRegisterResultStatus){
      case UserRegisterResultStatus.successful:
        return "register successful";
      case UserRegisterResultStatus.userAlreadyExists:
        return "user already exists";
      case UserRegisterResultStatus.unknownError:
        return "unknown error";
      case UserRegisterResultStatus.unableToReachServer:
        return "unable to reach server";
      case null:
        return "";
    }
  }

  static Color getColorLogIn(UserLoginResultStatus? loginResultStatus){
    if(loginResultStatus == UserLoginResultStatus.successful)return Colors.green;
    return Colors.redAccent;
  }

  static Color getColorRegister(UserRegisterResultStatus? userRegisterResultStatus){
    if(userRegisterResultStatus == UserRegisterResultStatus.successful)return Colors.green;
    return Colors.redAccent;
  }

  final Color Function(T t) getColor;
  final String Function(T t) getText;
  final T t;

  const AuthErrorText({
    Key? key,
    required this.getColor,
    required this.getText,
    required this.t,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Color c = getColor(t);
    String text = getText(t);

    if(t == null){
      return const SizedBox(height: 16,);
    }

    return SizedBox(
      height: 16,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Divider(color: c,)),
            const SizedBox(width: 8,),
            Text(
              text.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'LexendDeca',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color:c
              ),
            ),
            const SizedBox(width: 8,),

            Expanded(child: Divider(color: c,)),
          ]
      ),
    );

  }
}

