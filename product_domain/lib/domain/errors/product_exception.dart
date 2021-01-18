class ProductException implements Exception {
  final String _message;
  final Exception innerException;

  ProductException({this.innerException, String message}) : _message = message;

  String get message =>
      _message ?? innerException.toString()?.replaceAll('Exception: ', '');
}
