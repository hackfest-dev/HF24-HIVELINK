import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TestDataCallCall {
  static Future<ApiCallResponse> call({
    String? humidity = '',
    String? temperature = '',
    String? weight = '',
    String? audioURL = '',
  }) async {
    final ffApiRequestBody = '''
{
  "humidity": "$humidity",
  "temperature": "$temperature",
  "weight": "$weight",
  "audioURL": "$audioURL"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TestDataCall',
      apiUrl: 'https://4d1f-117-236-190-193.ngrok-free.app/hive',
      callType: ApiCallType.POST,
      headers: {
        'message': '',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ChatBotCallCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "prompt": "$prompt"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChatBotCall',
      apiUrl: 'grwgrwg',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
