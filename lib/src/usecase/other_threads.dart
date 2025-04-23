import 'dart:isolate';

class ParseUseCase<T> {
  Future<T> execute(dynamic response, T Function(dynamic) parser) async {
    final receivePort = ReceivePort();

    await Isolate.spawn<_ParseArgs<T>>(
      _parse,
      _ParseArgs<T>(response, parser, receivePort.sendPort),
    );

    final result = await receivePort.first as T;
    return result;
  }

  static void _parse<T>(_ParseArgs<T> args) {
    final parsedData = args.parser(args.response);
    args.sendPort.send(parsedData);
  }
}

class _ParseArgs<T> {
  final dynamic response;
  final T Function(dynamic) parser;
  final SendPort sendPort;

  _ParseArgs(this.response, this.parser, this.sendPort);
}
