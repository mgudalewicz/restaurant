import 'package:restaurant/models/soups/soup.dart';
import 'package:restaurant/providers/_provider.dart';
import 'package:restaurant/service_locator.dart';

class SoupsDataManager {
  final SoupsDataProvider _soupsDataProvider = sl();

  Future<void> fetch() async {
    _soupsDataProvider.fetchAllSoup();
  }

  Stream<List<Soup>> getAllSoups() {
    return _soupsDataProvider.getSoupsStream();
  }
}
