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
  final server = Server(
    [GreeterService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 5555);
  print('Server listening on port ${server.port}...');
}
