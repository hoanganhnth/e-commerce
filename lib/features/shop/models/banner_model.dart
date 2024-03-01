import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  bool active;
  String imageUrl;
  String targetScreen;

  BannerModel({
    required this.active,
    required this.imageUrl,
    required this.targetScreen,
  });
  static BannerModel empty() => BannerModel( active: true, imageUrl: '', targetScreen: '');

  Map<String, dynamic> tojson() {
    return {
      'Active': active,
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,

    };
  }

  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BannerModel(
        active: data['Active'] ?? '',
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen:  data['TargetScreen'] ?? '',
      );
    } else {
      return BannerModel.empty();
    }
  }

}