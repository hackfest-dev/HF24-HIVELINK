import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TestDataCallCall {
  static Future<ApiCallResponse> call({
    List<int>? humidityList,
    List<double>? temperatureList,
    List<double>? weightList,
    List<String>? dateTimeList,
    String? audioURL =
        'https://firebasestorage.googleapis.com/v0/b/login-25hn6a.appspot.com/o/users%2FhI4VKFFMydYxlAK8L9OdCOL1C5B3%2Fuploads%2F1712380442602174.wav?alt=media&token=0527740c-f50f-47bf-825e-6c0d2867272b',
  }) async {
    final humidity = _serializeList(humidityList);
    final temperature = _serializeList(temperatureList);
    final weight = _serializeList(weightList);
    final dateTime = _serializeList(dateTimeList);

    final ffApiRequestBody = '''
{
  "humidity": $humidity,
  "temperature": $temperature,
  "weight": $weight,
  "audioURL": "$audioURL",
  "dateTime": $dateTime
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
