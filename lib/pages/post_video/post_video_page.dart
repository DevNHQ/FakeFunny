import 'dart:io';

import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/components/custom_appbar.dart';
import 'package:fake_funny/components/custom_button.dart';
import 'package:fake_funny/components/custom_input.dart';
import 'package:fake_funny/language/const.dart';
import 'package:fake_funny/pages/add_account/add_account_controller.dart';
import 'package:fake_funny/pages/post_video/post_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
class PostVideoPage extends StatelessWidget {
  const PostVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostVideoController>(builder: (controller) {
      return Scaffold(
        backgroundColor: whiteColor,
        appBar: CustomAppBar(
          title: 'title',
          leadingIcon: 'assets/icons/back.png',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(chooseVideo.tr, style: size16W500Default),
              InkWell(
                onTap: () => controller.getImage(type: 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: (MediaQuery.of(context).size.width - 32) / 2,
                    height: (MediaQuery.of(context).size.width - 32) / 2,
                    child: controller.user?.imageFile != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.width - 32) / 2)),
                      child: Image.memory(
                        controller.user!.imageFile!,
                        fit: BoxFit.cover,
                        width: (MediaQuery.of(context).size.width - 32) / 2,
                        height: (MediaQuery.of(context).size.width - 32) / 2,
                      ),
                    )
                        : const Icon(Icons.add),
                  ),
                ),
              ),
              CustomInput(
                title: name.tr,
                hint: name.tr.toLowerCase(),
                controller: controller.nameEditingController,
                onChanged: (value) => controller.addFormData(type: 0, value: value),
              ),
              CustomInput(
                title: 'comment',
                hint: name.tr.toLowerCase(),
                controller: controller.statusEditingController,
                onChanged: (value) => controller.addFormData(type: 1, value: value),
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomInput(
                      title: nameId.tr,
                      hint: "@${nameId.tr.toLowerCase()}",
                      controller: controller.musicEditingController,
                      onChanged: (value) => controller.addFormData(type: 4, value: value),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: CustomInput(
                      title: totalLike.tr,
                      hint: totalLike.tr.toLowerCase(),
                      onChanged: (value) => controller.addFormData(type: 2, value: int.parse(value)),
                      textInputType: TextInputType.number,
                      controller: controller.commentCountEditingController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomInput(
                        title: following.tr,
                        hint: following.tr.toLowerCase(),
                        textInputType: TextInputType.number,
                        controller: controller.musicEditingController,
                        onChanged: (value) => controller.addFormData(type: 3, value: int.parse(value)),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: CustomInput(
                      title: followers.tr,
                      hint: followers.tr.toLowerCase(),
                      textInputType: TextInputType.number,
                      controller: controller.likeCountEditingController,
                      onChanged: (value) => controller.addFormData(type: 4, value: int.parse(value)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                title: addAccount.tr,
                onPressed: () => {},
              ),
              const SizedBox(height: 16.0),
              // controller.initUser != null ?  CustomButton(
              //   title: deleteProfile.tr,
              //   onPressed: () => controller.deleteProfile(),
              // ) : const SizedBox(),
            ],
          ),
        ),
      );
      },
    );
  }
}
