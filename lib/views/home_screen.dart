import 'package:b/components/income_outcome_card.dart';
import 'package:b/constants/colors.dart';
import 'package:b/controllers/data_controller.dart';
import 'package:b/controllers/user_controller.dart';
import 'package:b/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../components/scroll_to_hide_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double appBarHeight = 66.0;
  final int contentPadding = 5;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<DataController>().addAmount();
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: ScrollToHideWidget(
        controller: scrollController,
        duration: const Duration(milliseconds: 200),
        child: NavigationBarTheme(
          data: const NavigationBarThemeData(
            backgroundColor: kbgLightColor,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorColor: kbgUlLightColor,
          ),
          child: NavigationBar(
            height: 8.h,
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.wallet,
                  color: Colors.white,
                ),
                label: 'Wallet',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.bar_chart,
                  color: Colors.white,
                ),
                label: 'Info',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          //
          SliverAppBar(
            title: Container(
              decoration: const BoxDecoration(color: kbgColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(),
                    child: const Icon(
                      FontAwesomeIcons.bell,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Summary',
                        style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 20.0),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    child: const Icon(
                      FontAwesomeIcons.gear,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            pinned: true,
            expandedHeight: 39.h,
            //
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(top: statusBarHeight),
                height: statusBarHeight + appBarHeight,
                decoration: const BoxDecoration(color: kbgColor),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(height: 2.h),

                      GetBuilder<UserController>(
                        builder: (controller) => SizedBox(
                          height: 8.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: contentPadding.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, ${controller.getUser()?.name.toCapitalized()}',
                                  style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Here you can see a breif overview of your finances',
                                  style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 2.h),

                      //
                      GetBuilder<DataController>(
                        builder: (controller) => SizedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: contentPadding.w),
                            child: Row(
                              children: [
                                IncomeOutcomeCard(
                                  title: 'Saving',
                                  percentage: 2,
                                  amount: controller.getBudget() == null ? 0 : controller.getBudget()!.budget,
                                  isIncome: true,
                                  onDetailTap: () {},
                                ),
                                SizedBox(width: 5.w),
                                IncomeOutcomeCard(
                                  title: 'Expense',
                                  percentage: 2,
                                  amount: controller.getBudget() == null ? 0 : controller.getBudget()!.totalExpense,
                                  isIncome: false,
                                  onDetailTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 2.h),

                      //
                    ],
                  ),
                ),
              ),
            ),
          ),

          //
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  height: 180,
                  decoration: BoxDecoration(
                    color: kbgLightColor,
                    borderRadius: BorderRadius.circular(10.0),
                    // boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10, offset: const Offset(2, 6))],
                  ),
                );
              },
              childCount: 20,
            ),
          ),

          //
        ],
      ),
    );
  }
}
