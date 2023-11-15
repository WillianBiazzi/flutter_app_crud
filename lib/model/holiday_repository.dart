import 'dart:convert';
//import 'package:meuapp/core/constantes.dart';
import 'package:meuapp/model/holiday_model.dart';
import 'package:http/http.dart' as http;



class HolidayRepository {
  final Uri url = Uri.parse('https://brasilapi.com.br/api/feriados/v1/2024');

  Future<List<HolidayEntity>> getHolidays() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => HolidayEntity.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar os feriados');
    }
  }
}