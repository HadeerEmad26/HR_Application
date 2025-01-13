import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../auth_cubit/login_cubit.dart';
import '../auth_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSucessState) {
                  showToast(
                      message: AppStrings.loginSuccessfully,
                      state: ToastStates.success);
                  navigateReplacement(
                      context: context, route: Routes.homeScreen);
                }
                if (state is LoginErrorState) {
                  showToast(message: state.message, state: ToastStates.error);
                }
              },
              builder: (context, state) {
                return Form(
                  key: BlocProvider.of<LoginCubit>(context).loginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //____text___
                      const Padding(
                        padding: EdgeInsets.only(top: 75.0, left: 10),
                        child: Text(
                          AppStrings.signIn,
                          style: TextStyle(
                            fontSize: 24,
                            color: AppColors.green,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      // email
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomTextFormField(
                          preIcon: Icons.email_outlined,
                          controller: BlocProvider.of<LoginCubit>(context)
                              .emailController,
                          hint: AppStrings.email,
                          hintColorStyle: AppColors.hintColor,
                          validate: (data) {
                            if (data!.isEmpty || !data.contains('@rqmmyat.com')) {
                              return AppStrings.pleaseEnterValidEmail;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 24.h),
                      //___password__
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomTextFormField(
                          preIcon: Icons.lock_outline,
                          controller: BlocProvider.of<LoginCubit>(context)
                              .passwordController,
                          hint: AppStrings.password,
                          hintColorStyle: AppColors.hintColor,
                          isPassword: BlocProvider.of<LoginCubit>(context)
                              .isLoginPasswordShowing,
                          icon: BlocProvider.of<LoginCubit>(context).suffixIcon,
                          suffixIconOnPressed: () {
                            BlocProvider.of<LoginCubit>(context)
                                .changeLoginPasswordSuffixIcon();
                          },
                          validate: (data) {
                            if (data!.length < 6 || data.isEmpty) {
                              return AppStrings.pleaseEnterValidPassword;
                            }
                            return null;
                          },
                        ),
                      ),
                      //___rememberMe___
                      Row(
                        children: [
                          Radio(
                            activeColor: AppColors.green,
                            value: "rememberMe",
                            groupValue:
                                BlocProvider.of<LoginCubit>(context).groupValue,
                            onChanged: (value) {
                              BlocProvider.of<LoginCubit>(context)
                                  .changeGroupValue(value);
                            },
                          ),
                          Text(
                            AppStrings.rememberMe,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),

                      //___button___
                     Padding(
                              padding: const EdgeInsets.only(
                                left: 88.0,
                              ),
                              child: SizedBox(
                                height: 44.h,
                                width: 200.w,
                                child: state is LoginLoadingState
                                    ? const CustomLoadingIndicator()
                                    :  CustomButton(
                                  onPressed: () {
                                    if (BlocProvider.of<LoginCubit>(context)
                                        .loginKey
                                        .currentState!
                                        .validate()) {
                                      BlocProvider.of<LoginCubit>(context)
                                          .login();
                                      navigateReplacement(context: context, route: Routes.homeScreen);
                                    }
                                  },
                                  background: AppColors.green,
                                  text: AppStrings.loginIn,
                                )
                              ),
                            )
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 70.h,
            ),
            const Center(
              child: CustomImage(
                imagePath: AppAssets.logIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
