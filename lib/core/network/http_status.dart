enum HttpStatusEnum {
  success,
  created,
  badRequest,
  unauthorized,
  notFound,
  serverError,
  unknown
}

HttpStatusEnum mapStatusCode(int? code) {
  switch (code) {
    case 200:
      return HttpStatusEnum.success;
    case 201:
      return HttpStatusEnum.created;
    case 400:
      return HttpStatusEnum.badRequest;
    case 401:
      return HttpStatusEnum.unauthorized;
    case 404:
      return HttpStatusEnum.notFound;
    case 500:
      return HttpStatusEnum.serverError;
    default:
      return HttpStatusEnum.unknown;
  }
}