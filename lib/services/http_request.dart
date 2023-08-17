import 'package:dio/dio.dart';
import 'config.dart';

class QYHttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: QYHttpConfig.baseUrl,
    connectTimeout: QYHttpConfig.timeout,
  );

  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(
    String url, {
    String method = 'get',
    Map<String, dynamic>? params,
    Interceptor? interceptor,
  }) async {
    final options = Options(method: method);

    // 拦截器
    // 全局默认拦截器
    Interceptor defaultInterceptor = InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print('请求拦截');
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print('响应拦截');
        return handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        return handler.next(e);
      },
    );
    List<Interceptor> interceptors = [defaultInterceptor];
    // 如果某个请求有单独的拦截器
    if (interceptor != null) {
      interceptors.add(interceptor);
    }
    dio.interceptors.addAll(interceptors);

    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioException catch (error) {
      return Future.error(error);
    }
  }
}
