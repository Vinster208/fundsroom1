
import 'dart:convert';
import 'package:http/http.dart' as http;

class Stock {
  final String name;
  final double currentPrice;

  Stock({required this.name, required this.currentPrice});

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      name: json['name'],
      currentPrice: json['current_price'].toDouble(),
    );
  }
}

class StockService {
  static Future<List<Stock>> getStocks() async {
    var url = 'http://localhost:3000/stocks';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body) as List;
    return json.map((stockJson) => Stock.fromJson(stockJson)).toList();
  }
}
