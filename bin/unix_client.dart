import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:taekwondo_app/grpc/generated/proto_service.pbgrpc.dart';

Future<void> main(List<String> args) async {
  final udsAddress =
      InternetAddress('localhost', type: InternetAddressType.unix);
  final channel = ClientChannel(
    udsAddress,
    port: 0,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub = GreeterClient(channel);

  final name = args.isNotEmpty ? args[0] : 'world';

  try {
    final response = await stub.sayHello(RequestMessage()..name = name);
    print('Greeter client received: ${response.message}');
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}
