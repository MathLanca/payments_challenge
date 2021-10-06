class PaymentDetail {
  String? description;
  double? value;

  PaymentDetail({this.description, this.value});

  PaymentDetail.fromJson(Map<String, dynamic> json)
      : description = json["description"],
        value = json["value"];

  Map<String, dynamic> toJson() => {
        "description": description,
        "value": value,
      };
}
