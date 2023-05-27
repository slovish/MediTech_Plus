class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An unknown error occured."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a strong password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Email in invalid');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'This email is registered with another account');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation is not allowed');
      case 'user-diabled':
        return const SignUpWithEmailAndPasswordFailure(
            'User in disabled, please contact support for help');

      default:
      return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
