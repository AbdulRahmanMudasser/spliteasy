import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tip_calculator/controllers/home_controller.dart';
import 'package:tip_calculator/pages/widgets/home%20page/calculate_row.dart';
import 'package:tip_calculator/pages/widgets/home%20page/main_container.dart';
import 'package:tip_calculator/pages/widgets/home%20page/tip_card.dart';
import 'package:tip_calculator/utils/extensions/responsive_extension.dart';
import 'package:tip_calculator/utils/styling/app_text_styles.dart';

import '../utils/styling/app_colors.dart';
import '../utils/widgets/reusable_button.dart';
import '../utils/widgets/reusable_text_field.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // logo
            Container(
              padding: EdgeInsets.only(bottom: 4.0.hp, top: 7.0.hp),
              // height: 10.0.hp,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.logoBackgroundColor,
              ),
              child: SvgPicture.asset(
                "assets/images/logo.svg",
              ),
            ),

            // main container
            MainContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // bill text
                  Text(
                    "B I L L",
                    style: AppTextStyles.darkSmallTextStyle,
                  ),

                  SizedBox(
                    height: 1.25.hp,
                  ),

                  // enter total bill text field
                  ReusableTextField(
                    controller: controller.billController,
                    icon: Icons.money,
                    hintText: '0.0',
                    onChanged: (value) => controller.handleTextFieldChange(
                      value: value,
                      updateFunction: controller.updateTotalBill,
                      isDouble: true,
                      exceptionValue: 0.0,
                    ),
                  ),

                  SizedBox(
                    height: 3.0.hp,
                  ),

                  // select tip text
                  Text(
                    "S E L E C T   T I P   %",
                    style: AppTextStyles.darkSmallTextStyle,
                  ),

                  SizedBox(
                    height: 1.75.hp,
                  ),

                  // select tip cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TipCard(tip: "5"),
                      SizedBox(
                        width: 2.0.wp,
                      ),
                      TipCard(tip: "10"),
                      SizedBox(
                        width: 2.0.wp,
                      ),
                      TipCard(tip: "15"),
                    ],
                  ),

                  SizedBox(
                    height: 1.25.hp,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TipCard(tip: "20"),
                      SizedBox(
                        width: 2.0.wp,
                      ),
                      TipCard(tip: "25"),
                      SizedBox(
                        width: 2.0.wp,
                      ),
                      SizedBox(
                        width: 27.0.wp,
                        child: ReusableTextField(
                          controller: controller.customTipController,
                          icon: null,
                          verticalPadding: 0.75,
                          hintText: "C U S T O M",
                          textAlign: TextAlign.center,
                          hintFontSize: 11,
                          horizontalPadding: 1,
                          onChanged: (value) => controller.handleTextFieldChange(
                            value: value,
                            updateFunction: controller.updateTipPercentage,
                            isDouble: true,
                            exceptionValue: 5.0,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 3.0.hp,
                  ),

                  // number of people text
                  Text(
                    "N U M B E R   O F   P E O P L E",
                    style: AppTextStyles.darkSmallTextStyle,
                  ),

                  SizedBox(
                    height: 1.25.hp,
                  ),

                  // enter number of people text field
                  ReusableTextField(
                    controller: controller.numberOfPersonController,
                    icon: Icons.person,
                    hintText: '1',
                    onChanged: (value) => controller.handleTextFieldChange(
                      value: value,
                      updateFunction: controller.updateNumberOfPerson,
                      isDouble: false,
                      exceptionValue: 1,
                    ),
                  ),

                  SizedBox(
                    height: 2.5.hp,
                  ),

                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "C U R R E N C Y",
                          style: AppTextStyles.darkSmallTextStyle,
                        ),
                        DropdownButton(
                          style: AppTextStyles.darkSmallTextStyle,
                          dropdownColor: AppColors.lightTextColor,
                          value: controller.currentCurrency.value,
                          items: [
                            DropdownMenuItem(
                              value: 'Dollar',
                              child: Text(
                                "D O L L A R",
                                style: AppTextStyles.darkSmallTextStyle.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Pakistani Rupee',
                              child: Text(
                                "P K R",
                                style: AppTextStyles.darkSmallTextStyle.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Indian Rupee',
                              child: Text(
                                "I N R",
                                style: AppTextStyles.darkSmallTextStyle.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            controller.updateCurrentCurrency(value);
                          },
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 3.0.hp,
                  ),

                  // calculation card
                  Obx(
                    () => Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.0.wp, vertical: 3.0.hp),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          // tip amount per person
                          CalculationRow(
                            amount: "${controller.tipAmountPerPerson}",
                            titleText: "T I P",
                          ),

                          SizedBox(
                            height: 3.0.hp,
                          ),

                          // total amount per person
                          CalculationRow(
                            amount: "${controller.totalAmountPerPerson}",
                            titleText: "T O T A L",
                          ),

                          SizedBox(
                            height: 3.0.hp,
                          ),

                          // reset button
                          ReusableButton(
                            text: "R E S E T",
                            onTap: () => controller.resetInput(),
                            color: AppColors.lightTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
