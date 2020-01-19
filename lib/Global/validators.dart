class Validators{
   emailValidator(){
     return (value) {
        if (value.isEmpty()) {
          return "Please enter something!";
        } else
          return null;
      };
  }
  passwordValidator(){
    return (value){
      if(value.isEmpty()){
        return "Please enter Something";
      }
      else
      return null;
    };
  }

}