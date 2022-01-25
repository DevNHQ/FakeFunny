import 'package:fake_funny/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: ListView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 16),
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    );
                  },),
              ),
              Container(
                height: 55,
                color: Colors.transparent,
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icons/live.png',
                      width: 24,
                      height: 24,
                    ),
                    Row(
                      children: [
                        Text('Dang Fllow', style: size16W500White),
                        Text(' | ', style: size16W500White),
                        Text('Dang Fllow', style: size16W500White),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/search.png',
                      width: 32,
                      height: 32,
                      color: whiteColor,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
