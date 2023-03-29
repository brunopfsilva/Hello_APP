class PaycheckModel {
  String? namePaycheck;
  String? subNamePaycheck;
  String? linkPaycheckDownload;

  PaycheckModel(
      {this.namePaycheck, this.subNamePaycheck, this.linkPaycheckDownload});

  PaycheckModel.fromJson(Map<String, dynamic> json) {
    namePaycheck = json['namePaycheck'];
    subNamePaycheck = json['subNamePaycheck'];
    linkPaycheckDownload = json['linkPaycheckDownload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namePaycheck'] = this.namePaycheck;
    data['subNamePaycheck'] = this.subNamePaycheck;
    data['linkPaycheckDownload'] = this.linkPaycheckDownload;
    return data;
  }
}
