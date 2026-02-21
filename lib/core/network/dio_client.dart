import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.careeranalyzer.dev/v1',
        // TODO: Replace with actual API base URL on backend integration
        connectTimeout: const Duration(minutes: 6),
        receiveTimeout: const Duration(minutes: 6),
        contentType: 'application/json',
      ),
    );

    // Add mock interceptor for development
    _dio.interceptors.add(
      MockInterceptor(),
    );
  }

  Dio get dio => _dio;
}

/// Mock interceptor to simulate API responses during development.
/// Replace this with real API calls once backend is ready.
class MockInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    handler.next(err);
  }
}

// Riverpod provider for DioClient singleton

final dioProvider = Provider((ref) => DioClient().dio);
