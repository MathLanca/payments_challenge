class PaymentDetailDto {
  String? description;
  int? value;

  PaymentDetailDto({this.description, this.value});

  PaymentDetailDto.fromJson(Map<String, dynamic> json)
      : description = json["descripton"],
        value = json["value"];

  Map<String, dynamic> toJson() => {
        "description": description,
        "value": value,
      };
}
