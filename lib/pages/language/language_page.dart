import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/components/custom_appbar.dart';
import 'package:fake_funny/language/const.dart';
import 'package:fake_funny/pages/language/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: lang.tr,
      ),
      body: GetBuilder<LanguageController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0),
            child: ListView.builder(
              itemCount: controller.languageList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                var item = controller.languageList[index];
                return InkWell(
                  onTap: () => controller.updateLang(value: item.key),
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 16.0),
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                item.imageCountry,
                                width: 35,
                                height: 35,
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                item.country,
                                style: size14W500Default,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Radio(
                            value: index,
                            activeColor: baseAppColor,
                            groupValue: item.key == controller.selectedLang
                                ? index
                                : controller.languageList.length,
                            onChanged: (value) => controller.updateLang(value: item.key),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
