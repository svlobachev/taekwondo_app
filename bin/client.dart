import 'package:grpc/grpc.dart';
import 'package:taekwondo_app/grpc/generated/proto_service.pbgrpc.dart';

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 6565,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  final stub = GreeterClient(channel);

  final name = args.isNotEmpty ? args[0] : 'Sergei';

  try {
    final response = await stub.sayHello(
      RequestMessage()..name = name,
      options: CallOptions(compression: const GzipCodec()),
    );
    print('Greeter client received: ${response.message}');
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}
