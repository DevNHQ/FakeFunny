import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/components/custom_appbar.dart';
import 'package:fake_funny/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PostOptionsPage extends StatelessWidget {
  const PostOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data  = ['Add Image', 'AddVideo', 'AddStory'];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Accounts',
      ),
      body: Column(
        children: [
          Container(
            height: 50.0,
            color: Colors.orange,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 3,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.toNamed(AppRoutes.addAccount),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(top: index != 0 ? 16.0 : 0.0),
                      height: 100.0,
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Text(
                        data[index],
                        style: size14W500Default,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
