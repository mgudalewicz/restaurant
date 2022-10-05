import 'package:restaurant/models/extras/extra.dart';
import 'package:restaurant/providers/_provider.dart';
import 'package:restaurant/service_locator.dart';

class ExtrasDataManager {
  final ExtrasDataProvider _extrasDataProvider = sl();

  Future<void> fetch() async {
    _extrasDataProvider.fetchAllExtra();
  }

  Stream<List<Extra>> getAllExtras() {
    return _extrasDataProvider.getExtrasStream();
  }
}
