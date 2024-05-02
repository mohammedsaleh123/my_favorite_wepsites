
import 'package:favicon/favicon.dart';
import 'package:my_favorite_wepsites/core/servies_locator/servies_locator.dart';

import '../resources/get_url_fivicon_service.dart';

class GetUrlRepo {
  final GetUrlFivIconService getUrlService = sl<GetUrlFivIconService>();
  Future<Favicon?> getUrlImage(String websiteUrl) {
    return getUrlService.getUrlImage(websiteUrl);
  }
}
