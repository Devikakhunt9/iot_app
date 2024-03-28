class EnergyResponseModel {
  String energy;

  EnergyResponseModel({required this.energy});

  factory EnergyResponseModel.fromJson(Map<String, dynamic> json) {
    return EnergyResponseModel(
      energy: json['energy'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.energy;
    return data;
  }
}