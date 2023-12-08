class AuthInfoDTO {
  final String token;

  AuthInfoDTO({required this.token});

  factory AuthInfoDTO.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'token': String token,
      } =>
        AuthInfoDTO(token: token),
      _ => throw const FormatException('Failed convert to AuthInfo')
    };
  }
}
