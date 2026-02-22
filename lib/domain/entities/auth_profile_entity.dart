class AuthProfileEntity {
  final bool isLoggedIn;
  final String? nickname;
  final String? email;

  const AuthProfileEntity({
    required this.isLoggedIn,
    this.nickname,
    this.email,
  });

  const AuthProfileEntity.guest() : this(isLoggedIn: false);

  AuthProfileEntity copyWith({
    bool? isLoggedIn,
    String? nickname,
    String? email,
  }) {
    return AuthProfileEntity(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
    );
  }
}
