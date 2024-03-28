class StatusResponseModel {
    String status;

    StatusResponseModel({required this.status});

    factory StatusResponseModel.fromJson(Map<String, dynamic> json) {
        return StatusResponseModel(
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status'] = this.status;
        return data;
    }
}