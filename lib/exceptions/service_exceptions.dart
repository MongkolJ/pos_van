abstract class ServiceException implements Exception {
  late String message;
  late int errorCode;
}

///The InternalServerError exception is used when the server encounters an
/// error that prevents it from fulfilling a request
class InternalServerError implements ServiceException {
  @override
  int errorCode;

  @override
  String message;

  InternalServerError({
    required this.message,
    required this.errorCode,
  });
}

///ConnectionFailedError exception is used when a connection to a
///server or service fails.
class ConnectionFailedError implements ServiceException {
  @override
  int errorCode;

  @override
  String message;

  ConnectionFailedError({
    required this.message,
    required this.errorCode,
  });
}

/// This exception can be used to handle authentication errors such as invalid
/// credentials, expired tokens, or unauthorized access.
class AuthenticationError implements ServiceException {
  @override
  int errorCode;

  @override
  String message;

  AuthenticationError({
    required this.message,
    required this.errorCode,
  });
}

/// This exception can be used when a requested resource is not found on
/// the server.
class ResourceNotFoundError implements ServiceException {
  @override
  int errorCode;

  @override
  String message;

  ResourceNotFoundError({
    required this.message,
    required this.errorCode,
  });
}

/// This exception can be used when the input data provided to a service is
/// invalid or does not meet the required criteria.
class InvalidInputError implements ServiceException {
  @override
  int errorCode;

  @override
  String message;

  InvalidInputError({
    required this.message,
    required this.errorCode,
  });
}

/// This exception can be used to handle cases when a service request
/// exceeds a specific time limit and fails.
class TimeoutError implements ServiceException {
  @override
  int errorCode;

  @override
  String message;

  TimeoutError({
    required this.message,
    required this.errorCode,
  });
}

/// This exception can be used to handle cases where the user does not have
/// sufficient permissions to perform a certain action.
class PermissionDeniedError implements ServiceException {
  @override
  int errorCode;

  @override
  String message;

  PermissionDeniedError({
    required this.message,
    required this.errorCode,
  });
}

/// This exception can be used to handle cases where a user is trying to
/// create a resource that already exists.
class DuplicateEntryError implements ServiceException {
  @override
  int errorCode;

  @override
  String message;

  DuplicateEntryError({
    required this.message,
    required this.errorCode,
  });
}

/// This exception can be used to handle cases where a service is
/// unavailable or not responding.
class ServiceUnavailableError implements ServiceException {
  @override
  int errorCode;

  @override
  String message;

  ServiceUnavailableError({
    required this.message,
    required this.errorCode,
  });
}
