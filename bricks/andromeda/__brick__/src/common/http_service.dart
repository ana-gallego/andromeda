import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpService {
  String url = "";
  String timeoutMessage =
      'We couldn\'t connect to our servers. Try again in a moment.';

  Future<String?>? token() async {
    return "12345678";
  }

  /// [GET]
  Future<HttpServiceResponse> get(
      {required String endpoint, http.Client? client}) async {
    http.Client? httpClient = client ?? http.Client();

    try {
      Response response =
          await httpClient.get(Uri.parse("$url$endpoint"), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        if (await token() != null)
          HttpHeaders.authorizationHeader: "Bearer ${await token()}",
      }).timeout(
        const Duration(seconds: 10),
        onTimeout: (() => throw TimeoutException("{'error': 'Timeout'}")),
      );
      return validateResponse(response);
    } on TimeoutException catch (_) {
      return HttpServiceResponse(success: false, message: timeoutMessage);
    } catch (e) {
      return HttpServiceResponse(success: false, message: "$e");
    }
  }

  Future<HttpServiceResponse> post(
      {required String endpoint,
      required Map<String, dynamic> body,
      http.Client? client}) async {
    http.Client? httpClient = client ?? http.Client();
    try {
      Response response = await httpClient
          .post(Uri.parse("$url$endpoint"), body: json.encode(body), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        if (await token() != null)
          HttpHeaders.authorizationHeader: "Bearer ${await token()}",
      }).timeout(
        const Duration(seconds: 20),
        onTimeout: (() => throw TimeoutException("{'error': 'Timeout'}")),
      );
      return await validateResponse(response);
    } on TimeoutException catch (_) {
      return HttpServiceResponse(success: false, message: timeoutMessage);
    } catch (e) {
      return HttpServiceResponse(
          success: false, body: "$e", message: "Error: $e");
    }
  }

  Future<HttpServiceResponse> put(
      {required String endpoint,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers,
      http.Client? client}) async {
    http.Client? httpClient = client ?? http.Client();
    try {
      Response response = await httpClient.put(Uri.parse("$url$endpoint"),
          body: json.encode(body),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            if (await token() != null)
              HttpHeaders.authorizationHeader: "Bearer ${await token()}",
          }).timeout(const Duration(seconds: 10),
          onTimeout: (() => throw TimeoutException("{'error': 'Timeout'}")));

      return validateResponse(response);
    } on TimeoutException catch (_) {
      return HttpServiceResponse(success: false, message: timeoutMessage);
    } catch (e) {
      return HttpServiceResponse(
          success: false, message: "e", body: "Error: $e");
    }
  }

  Future<HttpServiceResponse> delete(
      {required String endpoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      http.Client? client}) async {
    http.Client? httpClient = client ?? http.Client();
    try {
      Response response = await httpClient.delete(Uri.parse("$url$endpoint"),
          body: body != null ? json.encode(body) : null,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            if (await token() != null)
              HttpHeaders.authorizationHeader: "Bearer ${await token()}",
          }).catchError((onError) {
        log("Error", error: onError);
      });

      return validateResponse(response);
    } catch (e) {
      return HttpServiceResponse(success: false, message: "e", body: "$e");
    }
  }

  Future<HttpServiceResponse> validateResponse(Response response) async {
    bool success = false;

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        success = true;
        break;

      default:
        success = false;
    }

    var body = json.decode(response.body);
    String runtimeType = body.runtimeType.toString();
    if (runtimeType.contains("Json") || runtimeType.contains("Map")) {
      if (body.containsKey("error")) {
        if (body["error"].runtimeType != bool) {
          return HttpServiceResponse(
              success: false, message: body["error"], body: response.body);
        }
      }
    }

    return HttpServiceResponse(
        success: success, message: response.body, body: response.body);
  }
}

HttpService httpService = HttpService();

class HttpServiceResponse {
  bool? success;
  String? message;
  String? body;

  HttpServiceResponse({this.success, this.message, this.body});

  HttpServiceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['body'] = body;
    return data;
  }
}
