import 'package:efarm/screens/favoritesScreen.dart';
import 'package:efarm/screens/homepageScreen.dart';
import 'package:efarm/screens/myAdsScreen.dart';
import 'package:efarm/screens/newAdsScreen.dart';
import 'package:efarm/widgets/mainDrawer.dart';
import 'package:flutter/material.dart';

class TabsScreenView extends StatefulWidget {
  static const routeName= '/tabsScreenView';
  @override
  _TabsScreenViewState createState() => _TabsScreenViewState();
}

class _TabsScreenViewState extends State<TabsScreenView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(

          drawer: MainDrawer(),
          appBar: AppBar(
            title: Text('Buy and sell animals'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.add_circle_outline,size: 25.0,),
                  text: 'Sell Animal',
                ),
                Tab(
                  icon: Icon(Icons.home_sharp),
                ),
                Tab(
                  text: 'My Ads',
                ),
                Tab(
                  text: 'Favorites',
                ),

              ],

            ),
          ),
          body: TabBarView(
              children: [
                NewAdsScreen(),
                HomePageScreen(),
                MyAdsScreen(),
                FavoritesScreen()
              ]
          ),
        )
    );
  }
}
