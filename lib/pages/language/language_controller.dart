import 'dart:async';
import 'package:fake_funny/common/constants.dart';
import 'package:fake_funny/common/storage_manager.dart';
import 'package:fake_funny/data/country.dart';
import 'package:fake_funny/localization_service.dart';
import 'package:fake_funny/model/m_country.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController{
  List<MCountry> languageList =   List<MCountry>.from(language.map((x) => MCountry.fromJson(x)));
  String? selectedLang;
  @override
  Future<void> onInit() async{
    initLanguage();
    super.onInit();
  }
  void initLanguage() async{
    String? lg =  await StorageManager.readData(Constants.language);
    if(lg != null) {
      selectedLang = lg;
      LocalizationService.changeLocale(lg);
    } else {
      selectedLang = 'vi';
      LocalizationService.changeLocale('vi');
    }
    update();
  }
  void updateLang({value}) {
    selectedLang = value;
    LocalizationService.changeLocale(value);
    StorageManager.saveData(Constants.language, value);
    update();
  }
}