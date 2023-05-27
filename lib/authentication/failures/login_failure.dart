class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "An unknown error occured."]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
            'Please enter a correct password');
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure('Email in invalid');
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure('Please register first');
      case 'user-diabled':
        return const LogInWithEmailAndPasswordFailure(
            'User in disabled, please contact support for help');

      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
