
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_app/common/utils/constants.dart';
import 'package:shop_app/global.dart';

class HttpUtil {
  //this is a singleton class meaning it only has one instance

  late Dio dio;

  //creating a private instance
  static final HttpUtil _instance = HttpUtil._internal();

  //adding factory gives us the ability  to return a value with the constructor
  factory HttpUtil() {
    return _instance;
  }

  //making the class  private
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL_ANDRIOD,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      //our api uses json
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    //initializing the dio with the base options
    dio = Dio(options);



    //dio interceptors act as middleware when sending a request
    //and posting a request
    dio.interceptors.add(InterceptorsWrapper(
      //the onRequest option runs anytime a request is made
      //it has 2 callbacks the request options and the interception handler
      onRequest: (options, handler){
        return handler.next(options);
      },
      //the onResponse option runs anytime a respone is gotten from the server
      //it has 2 callbacks the response and the interception handler
      onResponse: (response, handler){
        return handler.next(response);
    },
      //the onError option runs anytime an Error  is gotten from the server
      //it has 2 callbacks the error and the interception handler
      onError: (DioException e, handler){
        ErrorEntity errorInfo =  createErrorEntity(e);
        onError(errorInfo);
      }

    ));
  }

  //headers are used during post request for credential validation
  getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    //getting the access token from local storage
    var accessToken = Global.storageService.getUserToken().toString();

    //if we already have a token for the user in the database \
    //then we save the access token into the headers map
    //the map will be sent to the database as json
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'bearer $accessToken';
    }

    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //tries to get previous options if no options have been set it set them to a default value
    Options requestOptions = options?? Options();
    requestOptions.headers = requestOptions.headers??{};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    //overwrites the previous header options since everytime we login we get new tokens
    if(authorization!=null){
      requestOptions.headers!.addAll(authorization);
    }
    //sends a post request with our updated parameters
    // since the post function returns a response we store it in the response variable
   var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response.data;
  }
}


class ErrorEntity implements Exception{
  int code= -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  @override
  String toString(){
    if(message == "") return "exception";

    return "Exception code $code, $message";
  }
}


ErrorEntity createErrorEntity(DioException e){
  switch(e.type){

    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "connection timed out");
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "send timed out");
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "recive timed out");
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "bad ssl certificate");
    case DioExceptionType.badResponse:
      switch(e.response!.statusCode){
        case 400:
          return ErrorEntity(code: 400, message: "incorrect syntax");
        case 401:
          return ErrorEntity(code: 401, message: "unauthorized acces");

      }
      return ErrorEntity(code: -1, message: "bad server response");
    case DioExceptionType.cancel:
    return ErrorEntity(code: -1, message: "server canceled");
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "connection error");
    case DioExceptionType.unknown:
  return ErrorEntity(code: -1, message: "unknown error");
  }
}

void onError(ErrorEntity eInfo){
  print('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');

  switch(eInfo.code){
    case 401:
      print("you dont have access");
      break;
    case 400:
      print("invalid syntax");
      break;
    case 500:
      print("internal server error");
      break;
    default:
      print("unknown error");
      break;

  }

}