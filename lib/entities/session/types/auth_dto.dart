class AuthDTO {
  String login;
  String password;

  AuthDTO(this.login, this.password);

  Object toJson() {
    return {"login": login, "password": password};
  }
}
