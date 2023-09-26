import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mvvm_shop/presentation/resources/assets_manager.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/strings_manager.dart';
import 'package:mvvm_shop/presentation/resources/values_manager.dart';
import 'package:mvvm_shop/presentation/signUp/cubit/sign_up_cubit.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ImagePicker _picker = ImagePicker();
  late SignUpCubit signUpC;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: _screenLayout(),
            ),
          ),
        ),
      ),
    );
  }

  _screenLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
      child: Column(
        children: [_image(), _form()],
      ),
    );
  }

  _form() {
    return Container(
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          signUpC = context.read<SignUpCubit>();
          return Column(
            children: [
              _avatar(),
              _inputFiled(AppStrings.username, (value) {
                signUpC.setUserName(value);
              }),
              _inputFiled(AppStrings.emailHint, (value) {
                signUpC.setEmail(value);
              }),
              _inputFiled(AppStrings.password, (value) {
                signUpC.setPassword(value);
              }),
              _inputFiled(AppStrings.password, (value) {}),
              _phonePicker(),
              stretchedElevatedButton(AppStrings.signUP),
              const SizedBox(
                height: AppSize.s20,
              )
            ],
          );
        },
      ),
    );
  }

  ElevatedButton stretchedElevatedButton(String s) {
    return ElevatedButton(
        onPressed: () {
          signUpC.executeSignUp();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, AppSize.h50),
        ),
        child: Text(s));
  }

  _avatar() {
    return Container(
      child: Stack(children: [
        CircleAvatar(
          backgroundColor: ColorManager.lightGrey,
          backgroundImage: imageFile == null ? null : FileImage(imageFile!),
          radius: AppSize.h50,
          child: Container(
            child: imageFile == null
                ? const Icon(
                    Icons.add_a_photo_sharp,
                    size: AppSize.s30,
                  )
                : null,
          ),
        ),
        Positioned.fill(
          child: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.black.withOpacity(0.7),
                onTap: () {
                  _bottomSheet();
                  // Handle tap
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<dynamic> _bottomSheet() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: AppSize.h150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.all(AppSize.s8),
                    child: ElevatedButton(
                      child: const Text("camera"),
                      onPressed: () async {
                        await _pickImageCamera();
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(AppSize.s8),
                  child: ElevatedButton(
                    child: const Text("gallery"),
                    onPressed: () async {},
                  ),
                )
              ],
            ),
          );
        });
  }

  Padding _phonePicker() {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: InternationalPhoneNumberInput(
        initialValue: PhoneNumber(isoCode: 'EG'),
        selectorConfig: const SelectorConfig(
            leadingPadding: AppSize.s8,
            selectorType: PhoneInputSelectorType.DIALOG),
        spaceBetweenSelectorAndTextField: 0,
        onInputChanged: (value) => () {
          signUpC.setPhone(value.toString());
        },
      ),
    );
  }

  _inputFiled(String hint, void Function(String)? change) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          child: TextFormField(
        decoration: InputDecoration(hintText: hint),
        onChanged: change,
      )),
    );
  }

  _pickImageCamera() async {
    XFile? imageXfile = await _picker
        .pickImage(source: ImageSource.camera)
        .whenComplete(() => Navigator.of(context).pop());
    if (imageXfile != null) {
      setState(() {
        imageFile = File(imageXfile.path);
      });
    }
  }

  _picImageGallery() async {
    XFile? imageXfile = await _picker.pickImage(source: ImageSource.camera);
    if (imageXfile != null) {
      setState(() {
        imageFile = File(imageXfile.path);
      });
    }
  }

  SizedBox _image() => SizedBox(child: Image.asset(ImageAssets.splashLogo));
}
