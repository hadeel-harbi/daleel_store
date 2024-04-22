class Operation {
  final String? name;
  final String? amount;
  final String? type;

  Operation(this.name, this.amount, this.type);

  factory Operation.fromJson(Map<String, dynamic> json) =>
      Operation(json['name'], json['amount'], json['type']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['amount'] = amount;
    data['type'] = type;
    return data;
  }
}
