class _CustomException implements Exception {
  final _id;

  _CustomException(this._id);

  String toString() {
    return "$_id";
  }
}

class BadRequestException extends _CustomException {
  BadRequestException(id) : super(id);
}

class NotFoundException extends _CustomException {
  NotFoundException(id) : super(id);
}

class UnauthorizedException extends _CustomException {
  UnauthorizedException(id) : super(id);
}

class DefaultException extends _CustomException {
  DefaultException(id) : super(id);
}
