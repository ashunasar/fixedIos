class Validation {


  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }  // return true if valid


  // todo need repairs
  bool isPhoneNumberValid(String phnoNumber){
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(phnoNumber)) {
      return false;
    }
    return true;

  }

  bool isEmpty(String string){
    if(string.isEmpty || string==""){
      return true;
    }
    return false;
  }




}
