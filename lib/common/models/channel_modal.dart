import 'dart:convert';

class ChannelModel {
  String id;

  ChannelModel({required this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory ChannelModel.fromMap(Map<String, dynamic> map) {
    return ChannelModel(
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChannelModel.fromJson(String source) => ChannelModel.fromMap(json.decode(source));
}
