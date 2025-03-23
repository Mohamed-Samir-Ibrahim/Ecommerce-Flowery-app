import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'WebServices.g.dart';

@RestApi()
abstract class WebServices{

  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;


}