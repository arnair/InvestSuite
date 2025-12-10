import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:grpc/grpc.dart';

import '../lib/portfolio_service_impl.dart';

Future<void> main(List<String> _) async {
  // Load environment variables from .env file
  final env = DotEnv()..load();

  // Pass API key to the service
  PortfolioServiceImpl.initialize(finnhubApiKey: env['FINNHUB_API_KEY'] ?? '');
  final server = Server.create(
    services: [PortfolioServiceImpl()],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  // Get port from .env, then platform env, then default to 50051
  final port =
      int.tryParse(env['PORT'] ?? '') ??
      int.tryParse(Platform.environment['PORT'] ?? '') ??
      50051;

  await server.serve(port: port);

  print('');
  print('═══════════════════════════════════════════════════════');
  print('  🚀 InvestSuite gRPC Server running on port $port');
  print('═══════════════════════════════════════════════════════');
  print('');
}
