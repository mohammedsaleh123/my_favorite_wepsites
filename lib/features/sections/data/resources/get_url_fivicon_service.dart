import 'package:favicon/favicon.dart';

class GetUrlFivIconService {
  Future<Favicon?> getUrlImage(String websiteUrl) async {
    return await FaviconFinder.getBest(websiteUrl);
  }
}
