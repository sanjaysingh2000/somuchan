class AppValidations {


  String? emailValidation(String email){
    if (email.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? passwordValidation(String pass){
    if(pass.length>6){
      return 'Password must be at least 6 characters long';
    }
    return pass.isEmpty ? 'Password is required' : null;
  }
}