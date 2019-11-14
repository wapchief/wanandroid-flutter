class ResultEntity {
  dynamic data;
  int errorCode;
  String errorMsg;

  ResultEntity({this.data, this.errorCode, this.errorMsg});

  ResultEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'] == null ? '' : json['data'];
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}
