// Copyright (c) 2020, the gRPC project authors. Please see the AUTHORS file
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:taekwondo_app/grpc/generated/proto_service.pbgrpc.dart';

class GreeterService extends GreeterServiceBase {
  @override
  Future<ResponseMessage> sayHello(
      ServiceCall call, RequestMessage request) async {
    return ResponseMessage()..message = 'Hello, ${request.name}!';
  }
}

Future<void> main(List<String> args) async {
  final udsAddress =
      InternetAddress('localhost', type: InternetAddressType.unix);
  final server = Server([GreeterService()]);
  await server.serve(address: udsAddress);
  print('Start UNIX Server @localhost...');
}
