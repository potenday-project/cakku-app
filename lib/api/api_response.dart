class ApiResponse<T> {
  String code;
  String message;
  T? data;

  ApiResponse(this.code, this.message, this.data);

  ApiResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'],
        data = json['data'];
}
