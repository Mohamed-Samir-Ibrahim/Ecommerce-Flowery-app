import 'dart:convert';
import 'package:flowery/data/data_source/local_data_source/about/about_local_data_source.dart';
import 'package:flowery/data/model/profile_model/about_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AboutLocalDataSource)
class AboutLocalDataSourceImpl implements AboutLocalDataSource {
  @override
  Future<List<AboutModel>> loadAboutFromJson() async {
    final jsonStr = await rootBundle.loadString('assets/Flowery About Section JSON with Expanded Content.json');
    final data = json.decode(jsonStr);
    return (data['about_app'] as List)
        .map((e) => AboutModel.fromJson(e))
        .toList();
  }
}