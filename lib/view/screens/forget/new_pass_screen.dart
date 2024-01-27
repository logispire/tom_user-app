import 'package:sixam_mart/controller/auth_controller.dart';
import 'package:sixam_mart/controller/location_controller.dart';
import 'package:sixam_mart/controller/user_controller.dart';
import 'package:sixam_mart/data/model/response/userinfo_model.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/images.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:sixam_mart/view/base/custom_app_bar.dart';
import 'package:sixam_mart/view/base/custom_button.dart';
import 'package:sixam_mart/view/base/custom_snackbar.dart';
import 'package:sixam_mart/view/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/view/base/footer_view.dart';
import 'package:sixam_mart/view/base/menu_drawer.dart';

class NewPassScreen extends StatefulWidget {
  final String? resetToken;
  final String? number;
  final bool fromPasswordChange;
  const NewPassScreen({Key? key,
    required this.resetToken,
    required this.number,
    required this.fromPasswordChange
  })
      : super(key: key);

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).cardColor,
      appBar: CustomAppBar(
          title: widget.fromPasswordChange
              ? 'change_password'.tr
              : 'reset_password'.tr
      ),
      endDrawer: const MenuDrawer(),
      endDrawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [

            Positioned(
              top:MediaQuery.of(context).size.height*.0,
              left: MediaQuery.of(context).size.width*.0,
              child: Image.asset(
                Images.lefttopcorner,
                height: 120,
              ),
            ),
            Positioned(
            bottom:MediaQuery.of(context).size.height*.0,
            right: MediaQuery.of(context).size.width*.0,
              child: Image.asset(
                Images.rightbottomcorner,
              height: 150,
              ),
            ),Positioned(
              top:MediaQuery.of(context).size.height*.05,
              right: MediaQuery.of(context).size.width*.2,
              child: Image.asset(
                Images.righttop,
                height: 70,
              ),
            ),
            Positioned(
              top:MediaQuery.of(context).size.height*.15,
              right: MediaQuery.of(context).size.width*.0,
              child: Image.asset(
                Images.rightcenter,
                height: 100,
              ),
            ),
            Positioned(
              top:MediaQuery.of(context).size.height*.4,
              left: MediaQuery.of(context).size.width*.0,
              child: Image.asset(
                Images.leftcenter,
                height: 100,
              ),
            ),
            Positioned(
              bottom:MediaQuery.of(context).size.height*.1,
              left:MediaQuery.of(context).size.width*.0,
              child: Image.asset(
                Images.leftbottom,
                height: 80,
              ),
            ),

            SafeArea(
                child: Center(
                    child: Scrollbar(
                        child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: FooterView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                width: context.width > 700 ? 700 : context.width,
                padding: context.width > 700
                    ? const EdgeInsets.all(Dimensions.paddingSizeDefault)
                    : null,
                margin: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                decoration: context.width > 700
                    ? BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[Get.isDarkMode ? 700 : 300]!,
                              blurRadius: 5,
                              spreadRadius: 1)
                        ],
                      )
                    : null,
                child: Column(children: [
                  Image.asset(Images.forgetIcon, width: 100),
                  const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                  Text(
                    'enter_new_password'.tr,
                    textAlign: TextAlign.center,
                    style: robotoRegular.copyWith(
                        color: Theme.of(context).hintColor,
                        fontSize: Dimensions.fontSizeDefault),
                  ),
                  const SizedBox(height: 50),
                  Column(children: [
                    CustomTextField(
                      titleText: 'new_password'.tr,
                      controller: _newPasswordController,
                      focusNode: _newPasswordFocus,
                      nextFocus: _confirmPasswordFocus,
                      inputType: TextInputType.visiblePassword,
                      prefixImage: Images.unlock,
                      isPassword: true,
                    ),
                    const SizedBox(height: Dimensions.paddingSizeLarge),
                    CustomTextField(
                      titleText: 'confirm_password'.tr,
                      controller: _confirmPasswordController,
                      focusNode: _confirmPasswordFocus,
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.visiblePassword,
                      prefixImage: Images.unlock,
                      isPassword: true,
                      onSubmit: (text) => GetPlatform.isWeb ? _resetPassword() : null,
                    ),
                  ]),
                  const SizedBox(height: 40),
                  GetBuilder<UserController>(builder: (userController) {
                    return GetBuilder<AuthController>(builder: (authBuilder) {
                      return CustomButton(
                        buttonText: 'submit'.tr,
                        isLoading: authBuilder.isLoading && userController.isLoading,
                        onPressed: () => _resetPassword(),
                      );
                    });
                  }),
                ]),
              )),
            )))),
          ],
        ),
      ),
    );
  }

  void _resetPassword() {
    String password = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    if (password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    } else if (password.length < 6) {
      showCustomSnackBar('password_should_be'.tr);
    } else if (password != confirmPassword) {
      showCustomSnackBar('confirm_password_does_not_matched'.tr);
    }
    else {
      if (widget.fromPasswordChange) {
        UserInfoModel user = Get.find<UserController>().userInfoModel!;
        user.password = password;
        Get.find<UserController>().changePassword(user).then((response) {
          if (response.isSuccess) {
            showCustomSnackBar('password_updated_successfully'.tr,
                isError: false);
          } else {
            showCustomSnackBar(response.message);
          }
        });
      }
      else {
        Get.find<AuthController>()
            .resetPassword(widget.resetToken, '+${widget.number!.trim()}',
                password, confirmPassword)
            .then((value) {
          if (value.isSuccess) {
            Get.find<AuthController>()
                .login('+${widget.number!.trim()}', password)
                .then((value) async {
              Get.find<LocationController>()
                  .navigateToLocationScreen('reset-password');
            });
          } else {
            showCustomSnackBar(value.message);
          }
        });
      }
    }
  }
}
