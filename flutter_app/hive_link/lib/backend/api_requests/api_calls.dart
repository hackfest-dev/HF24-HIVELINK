import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TestDataCallCall {
  static Future<ApiCallResponse> call({
    List<int>? humidityList,
    List<double>? temperatureList,
    List<double>? weightList,
    int? dateTime,
    String? audioURL =
        'https://firebasestorage.googleapis.com/v0/b/login-25hn6a.appspot.com/o/users%2FhI4VKFFMydYxlAK8L9OdCOL1C5B3%2Fuploads%2Fhigh.wav?alt=media&token=10b4dab3-3d61-400d-8524-34a5ac19729c',
  }) async {
    final humidity = _serializeList(humidityList);
    final temperature = _serializeList(temperatureList);
    final weight = _serializeList(weightList);

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
      apiUrl: 'https://2eaa-115-243-167-82.ngrok-free.app/hive',
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

  static dynamic statusActivity(dynamic response) => getJsonField(
        response,
        r'''$.data.status_activity''',
      );
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
