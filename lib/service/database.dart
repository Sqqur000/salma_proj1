import 'package:salma_proj1/models/destinations_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;

  Future<List<DestinationsModel>> getAllDestinations() async {
    try {
      final data = await supabase
          .from('destinations')
          .select();

      print('======================');
      print('SUPABASE DATA: $data');
      print('ROWS: ${data.length}');
      print('======================');

      return data
          .map((element) => DestinationsModel.fromJson(element))
          .toList();
    } catch (e) {
      print('SUPABASE ERROR: $e');
      rethrow;
    }
  }
}