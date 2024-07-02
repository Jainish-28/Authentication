class AppExceptions implements Exception{

  final _message;
  final _prefix;

  AppExceptions([this._message,this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions{

  InternetException([String? message]) : super(message,"No Internet");
}

class RequestTimeOutException extends AppExceptions{

  RequestTimeOutException([String? message]) : super(message,"Request TimeOut");
}

class ServerException extends AppExceptions{

  ServerException([String? message]) : super(message,"Internal Server Error");
}

class InvalidUrlException extends AppExceptions{

  InvalidUrlException([String? message]) : super(message,"Invalid Url");
}

class FetchDataException extends AppExceptions{

  FetchDataException([String? message]) : super(message);
}

class InvalidRequestException extends AppExceptions{

  InvalidRequestException([String? message]) : super(message);
}