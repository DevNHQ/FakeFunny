import 'dart:io';

import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/components/custom_appbar.dart';
import 'package:fake_funny/components/custom_input.dart';
import 'package:fake_funny/pages/post_status/post_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PostStatusPage extends StatelessWidget {
  const PostStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        title: 'Add',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<PostStatusController>(builder: (controller) {
          return Column(
            children: [
              InkWell(
                onTap: () => controller.getImage(type: 0),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 32,
                  height: (MediaQuery.of(context).size.width - 32) * 175 / 250,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                    child: controller.user?.avatarFile != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            child: Image.file(
                              File.fromRawPath(controller.user!.avatarFile),
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width - 32,
                              height: (MediaQuery.of(context).size.width - 32) * 175 / 250,
                            ),
                          )
                        : const Icon(Icons.add),
                  ),
              ),
              CustomInput(
                title: 'Name',
                hint: 'name',
                onChanged: () => {},
              ),
              CustomInput(
                title: 'Post Count',
                hint: 'post count',
                onChanged: (value) => print(value),
                textInputType: TextInputType.number,
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomInput(
                      title: 'Followed',
                      hint: 'followed',
                      textInputType: TextInputType.number,
                      onChanged: () => {},
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: CustomInput(
                      title: 'Following',
                      hint: 'following',
                      textInputType: TextInputType.number,
                      onChanged: () => {},
                    ),
                  ),
                ],
              ),
            ],
          );
          },
        ),
      ),
    );
  }
}
