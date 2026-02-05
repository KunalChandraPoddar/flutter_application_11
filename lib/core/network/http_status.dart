enum HttpStatusEnum {
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  internalServerError,
  badGateway,
  unknown, 
  networkError, 
  success;

  static HttpStatusEnum mapStatusCode(int? code) {
    switch (code) {
      case 400:
        return HttpStatusEnum.badRequest;
      case 401:
        return HttpStatusEnum.unauthorized;
      case 403:
        return HttpStatusEnum.forbidden;
      case 404:
        return HttpStatusEnum.notFound;
      case 500:
        return HttpStatusEnum.internalServerError;
      case 502:
        return HttpStatusEnum.badGateway;
      default:
        return HttpStatusEnum.unknown;
    }
  }
}