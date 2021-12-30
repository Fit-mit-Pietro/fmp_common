

class StringValidator{

  static String? validatePassword(String? password){
    if(password == null || password.isEmpty){
      return "Please enter your password";
    }
    if(password.length < 6){
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? validateEmail(String? email){
    if(email == null || email.isEmpty){
      return "Please enter your email";
    }
    if(!email.contains("@")){
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validateUsername(String? username){
    if(username == null || username.isEmpty){
      return "Please enter your username";
    }
    if(username.length < 3){
      return "Username must be at least 3 characters";
    }
    return null;
  }

  static String? validateFirstName(String? text){
    if(text == null || text.isEmpty){
      return "Enter your first name";
    }
    return null;
  }

  static String? validateLastName(String? text){
    if(text == null || text.isEmpty){
      return "Enter your last name";
    }
    return null;
  }

  static String? validateNumberParsableNotNull(String? number){
    if(number == null || number.isEmpty){
      return "Field can't be empty";
    }

    int? i = int.tryParse(number);
    if(i == null){
      return "Please enter a valid number";
    }
    return null;
  }

  static String? validateStringNotNull(String? string){
    if(string == null || string.isEmpty){
      return "Field can't be empty";
    }
    return null;
  }
}