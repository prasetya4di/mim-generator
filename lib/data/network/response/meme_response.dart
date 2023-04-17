import 'package:mim_generator/data/entity/meme.dart';

class MemeResponse {
  bool? success;
  Data? data;

  MemeResponse({this.success, this.data});

  MemeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Meme>? memes;

  Data({this.memes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['memes'] != null) {
      memes = <Meme>[];
      json['memes'].forEach((v) {
        memes!.add(Meme.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (memes != null) {
      data['memes'] = memes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
