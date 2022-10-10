import 'package:b/components/custom_button.dart';
import 'package:b/constants/colors.dart';
import 'package:b/controllers/data_controller.dart';
import 'package:b/controllers/user_controller.dart';
import 'package:b/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  //
  late TextEditingController nameController;
  late TextEditingController budgetController;
  late TextEditingController dailyExpenseController;
  late TextEditingController monthlyIncomeController;
  late TextEditingController incomeDayController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    budgetController = TextEditingController();
    dailyExpenseController = TextEditingController();
    monthlyIncomeController = TextEditingController();
    incomeDayController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    budgetController.dispose();
    dailyExpenseController.dispose();
    monthlyIncomeController.dispose();
    incomeDayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(),
            height: 100.h,
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Hello there, \nTell us a little about yourself',
                      style: TextStyle(color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4.h),
                    CustomTextField(
                      editingController: nameController,
                      label: 'Name',
                      inputType: TextInputType.name,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      editingController: budgetController,
                      label: 'Budget',
                      inputType: TextInputType.number,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      editingController: dailyExpenseController,
                      label: 'Daily Expense',
                      inputType: TextInputType.number,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      editingController: monthlyIncomeController,
                      label: 'Monthly Income',
                      inputType: TextInputType.number,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      editingController: incomeDayController,
                      label: 'Income day',
                      inputType: TextInputType.datetime,
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
                CustomButton(
                  label: 'Done',
                  height: 6,
                  onPress: () {
                    if (nameController.text.isNotEmpty &&
                        budgetController.text.isNotEmpty &&
                        dailyExpenseController.text.isNotEmpty &&
                        monthlyIncomeController.text.isNotEmpty &&
                        incomeDayController.text.isNotEmpty) {
                      Get.find<UserController>().createUser(nameController.text);
                      Get.find<DataController>().createBudget(
                        int.parse(budgetController.text),
                        int.parse(dailyExpenseController.text),
                        int.parse(monthlyIncomeController.text),
                        int.parse(incomeDayController.text),
                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    }
                  },
                  borderRadius: 3.0,
                  width: 100,
                ),
                // SizedBox(height: 0.2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.label, this.inputType, required this.editingController}) : super(key: key);
  final String label;
  final TextInputType? inputType;
  final TextEditingController? editingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
            label,
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
          ),
        ),
        SizedBox(height: 1.h),
        TextFormField(
          controller: editingController,
          cursorColor: Colors.white,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
          ),
          keyboardType: inputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            filled: true,
            fillColor: kbgLightColor,
          ),
        ),
      ],
    );
  }
}
