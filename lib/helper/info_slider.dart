import 'package:bereal/data/info_data.dart';
import 'package:bereal/models/info.dart';

class InfoSlider {
  final int pages = 4;
  int currentPage = 0;

  void pageChange(int index) {
    if (currentPage < pages) {
      currentPage = index;
    }
  }

  InfoModel currentInfo() {
    return info_data[currentPage];
  }

  List<InfoModel> getInfoPages() {
    return info_data;
  }
}
