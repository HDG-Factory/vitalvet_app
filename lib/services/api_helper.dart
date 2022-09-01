bool isTokenError(error) {
  final tokenErrorMessages = [
    'jwt malformed',
    'invalid signature',
    'jwt expired',
    'jwt not before',
    'invalid token'
  ];

  bool isTokenErrorMessage = false;
  bool isTokenErrorStatusCode = error.response?.statusCode == 401;

  String message = error.response?.data['message'];
  for (var tokenErrMessage in tokenErrorMessages) {
    if (message == tokenErrMessage) {
      isTokenErrorMessage = true;
      break;
    }
  }

  return isTokenErrorStatusCode && isTokenErrorMessage;
}
