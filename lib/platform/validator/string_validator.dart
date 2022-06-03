

class StringValidator{

  static String? validatePassword(String? password){
    if(password == null || password.isEmpty){
      return "Bitte gebe dein Passwort ein";
    }
    if(password.length < 6){
      return "Das Passwort muss mindestens 6 Zeichen lang sein";
    }
    return null;
  }

  static String? validateEmail(String? email){
    if(email == null || email.isEmpty){
      return "Bitte gebe deine E-Mail an";
    }
    if(!email.contains("@")){
      return "Dies ist keine gültige E-Mail";
    }
    return null;
  }

  static String? validateUsername(String? username){
    if(username == null || username.isEmpty){
      return "Bitte gebe deinen Nutzernamen an";
    }
    if(username.length < 3){
      return "Muss mindestens drei Zeichen lang sein";
    }
    return null;
  }

  static String? validateFirstName(String? text){
    if(text == null || text.isEmpty){
      return "Gebe deinen Vornamen an";
    }
    return null;
  }

  static String? validateLastName(String? text){
    if(text == null || text.isEmpty){
      return "Gebe deinen Nachnamen an";
    }
    return null;
  }

  static String? validateIntParsableNotNull(String? number,{int? minValue,int? maxValue}){
    if(number == null || number.isEmpty){
      return "Bitte gebe einen Wert an";
    }

    int? i = int.tryParse(number);
    if(i == null){
      return "Dieser Wert ist nicht gültig";
    }

    if(minValue != null) {
      if(i < minValue){
        return "Wert muss mindestens $minValue sein";
      }
    }

    if(maxValue != null) {
      if(i > maxValue){
        return "Wert darf höchstens $maxValue sein";
      }
    }


    return null;
  }

  static String? validateStringNotNull(String? string){
    if(string == null || string.isEmpty){
      return "Dieses Feld kann nicht leer sein";
    }
    return null;
  }
}