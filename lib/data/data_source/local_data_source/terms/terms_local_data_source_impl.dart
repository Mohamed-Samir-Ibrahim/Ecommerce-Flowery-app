import 'dart:convert';
import 'package:flowery/data/data_source/local_data_source/terms/terms_local_data_source.dart';
import 'package:flowery/data/model/profile_model/terms_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TermsLocalDataSource)
class TermsLocalDataSourceImpl implements TermsLocalDataSource {
  @override
  Future<List<TermsModel>> loadTermsFromJson() async {
    final jsonString = await rootBundle.loadString(
        'assets/Flowery Terms and Conditions JSON with Arabic and English.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final List<dynamic> items = jsonData['terms_and_conditions'];
    return items.map((e) => TermsModel.fromJson(e)).toList();
  }
}