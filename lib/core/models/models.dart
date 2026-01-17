// Common request/response models

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final String? error;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.error,
  });

  factory ApiResponse.success(T data) {
    return ApiResponse(success: true, data: data);
  }

  factory ApiResponse.error(String error) {
    return ApiResponse(success: false, error: error);
  }
}

class PaginatedResponse<T> {
  final List<T> items;
  final int page;
  final int pageSize;
  final int total;
  final bool hasMore;

  PaginatedResponse({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.total,
    required this.hasMore,
  });
}
