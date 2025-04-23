import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

enum RequestType { get, put, post, patch, delete }

class NetworkService {
  NetworkService._();

  static final Map<String, http.Client> _activeClients = {};

  static Map<String, String> _getHeaders(String token, String contentType) => {
    'Content-Type': contentType,
    'Authorization': 'Bearer $token',
  };

  static Future<http.Response>? _createRequest({
    required String requestId,
    required RequestType requestType,
    required Uri uri,
    Map<String, String>? headers,
    String? body,
  }) {
    final client = http.Client();
    _activeClients[requestId] = client;

    Future<http.Response> responseFuture;

    switch (requestType) {
      case RequestType.get:
        responseFuture = client.get(uri, headers: headers);
        break;
      case RequestType.post:
        responseFuture = client.post(uri, headers: headers, body: body);
        break;
      case RequestType.put:
        responseFuture = client.put(uri, headers: headers, body: body);
        break;
      case RequestType.patch:
        responseFuture = client.patch(uri, headers: headers, body: body);
        break;
      case RequestType.delete:
        responseFuture = client.delete(uri, headers: headers, body: body);
        break;
    }

    return responseFuture
        .timeout(
          const Duration(seconds: 120),
          onTimeout:
              () =>
                  http.Response(jsonEncode({'error': 'Network timeout'}), 408),
        )
        .whenComplete(() => _activeClients.remove(requestId));
  }

  static Future<http.Response?>? sendRequest({
    required String requestId,
    required RequestType requestType,
    required String url,
    String token = '',
    String contentType = 'application/json',
    String? body,
    Map<String, String>? head,
  }) async {
    try {
      final headers = head ?? _getHeaders(token, contentType);
      return await _createRequest(
        requestId: requestId,
        requestType: requestType,
        uri: Uri.parse(url),
        headers: headers,
        body: body,
      );
    } on SocketException {
      throw "No internet connection.";
    } on HandshakeException {
      throw "Connection terminated during handshake";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<http.StreamedResponse?> sendMultipartRequest({
    required String requestId,
    required RequestType requestType,
    required String url,
    String token = '',
    Map<String, dynamic>? fields,
    Map<String, String>? head,
    Map<String, List<File>>? filesMap, // 👈 dynamic file groups
  }) async {
    try {
      var uri = Uri.parse(url);
      var request = http.MultipartRequest(
        requestType == RequestType.post ? 'POST' : 'PUT',
        uri,
      );

      final client = http.Client();
      _activeClients[requestId] = client;

      request.headers.addAll(head ?? _getHeaders(token, 'multipart/form-data'));

      // Add fields
      fields?.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Add multiple files per field
      if (filesMap != null) {
        for (var entry in filesMap.entries) {
          final fieldName = entry.key;
          final files = entry.value;

          for (var file in files) {
            request.files.add(
              await http.MultipartFile.fromPath(fieldName, file.path),
            );
          }
        }
      }

      final streamedResponse = await client
          .send(request)
          .timeout(
            const Duration(seconds: 120),
            onTimeout: () => throw "Request Timeout",
          );

      _activeClients.remove(requestId);
      return streamedResponse;
    } on SocketException {
      throw "No internet connection.";
    } on TimeoutException {
      throw "Request Timeout";
    } on HandshakeException {
      throw "Connection terminated during handshake";
    } catch (e) {
      throw e.toString();
    }
  }

  static void cancelRequest(String requestId) {
    if (_activeClients.containsKey(requestId)) {
      _activeClients[requestId]?.close();
      _activeClients.remove(requestId);
    }
  }
}
