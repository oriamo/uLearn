import 'dart:js_interop';

import 'package:dio/dio.dart';
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
      baseUrl: 'http://127.0.0.1:8000',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      //our api uses json
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    //initializing the dio with the base options
    dio = Dio(options);
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
    //tries to get previous options if no options have been set it set them to
    Options requestOptions = options?? Options();
    requestOptions.headers = requestOptions.headers??{};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    //overwrites the previous header options since everytime we login we get new tokens
    if(authorization!=null){
      requestOptions.headers!.addAll(authorization);
    }
    //sends a post request with our updated parameters
   var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response.data;
  }
}
