import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udemy_app/common/routes/names.dart';
import 'package:udemy_app/common/values/colors.dart';
import 'package:udemy_app/pages/home/home_controller.dart';
import 'package:udemy_app/pages/home/widgets/course_grid_widget.dart';
import 'package:udemy_app/pages/home/widgets/home_page_text_widget.dart';
import 'package:udemy_app/pages/home/widgets/menu_views_widget.dart';
import 'package:udemy_app/pages/home/widgets/search_view_widget.dart';
import 'package:udemy_app/pages/home/widgets/slider_views_widget.dart';
import 'package:udemy_app/pages/sign_in/models/user_item_model.dart';

import 'bloc/home_page_blocs.dart';
import 'bloc/home_page_states.dart';
import 'widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserItem userProfile;

  @override
  void initState() {
    super.initState();
    // _homeController = HomeController(context: context);
    // _homeController.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarHome(userProfile.avatar!.toString()),
      body: RefreshIndicator(
        onRefresh: () async {
          return HomeController(context: context).init();
        },
        child: BlocBuilder<HomePageBlocs, HomePageStates>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.courseItem.isEmpty) {
              // just call the init method to make the api call when the cache lost the data
              HomeController(context: context).init();
              debugPrint('...state.course is empty...');
              return const Center(child: CircularProgressIndicator());
            } else {
              debugPrint('...state.course is not empty...');
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0.h),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: homePageText(
                        userProfile.name!,
                        top: 5,
                        color: AppColors.primaryThirdElementText,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: homePageText(
                        'Hussein,',
                        top: 4,
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(top: 20.h),
                    ),
                    SliverToBoxAdapter(
                      child: searchView(),
                    ),
                    SliverToBoxAdapter(
                      child: sildersView(context, state),
                    ),
                    SliverToBoxAdapter(
                      child: menuViews(),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 0.w,
                      ),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.courseItem.length,
                          (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.COURSE_DETAIL,
                                  arguments: {
                                    'id': state.courseItem.elementAt(index).id,
                                  },
                                );
                              },
                              child: courseGrid(state.courseItem[index]),
                            );
                          },
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
