class AuthInfoDTO {
  final String token;
  final String tokenType;
  final int expiresIn;

  AuthInfoDTO({required this.token, required this.tokenType, required this.expiresIn});

  factory AuthInfoDTO.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'access_token': String token,
        'token_type': String tokenType,
        'expires_in': int expiresIn
      } =>
        AuthInfoDTO(token: token, tokenType: tokenType, expiresIn: expiresIn),
      _ => throw const FormatException('Failed convert to AuthInfo')
    };
  }
}
