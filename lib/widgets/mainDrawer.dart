import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, Icon icon, Function tapScreen) {
      return ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'JameelNooriNastalerq',
            color: Colors.black54,
          ),
        ),
        onTap: tapScreen,
      );
    }

    return Drawer(
      child: Column(
        children: [
          // =====================================
          // Above Container for heading
          // =====================================
          Container(
            padding: const EdgeInsets.all(16.0),
            // alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height * 0.19,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(backgroundImage: NetworkImage(''
                    'https://cdn2.f-cdn.com/contestentries/1316431/24595406/5ae8a3f2e4e98_thumb900.jpg'
                ),
                  maxRadius: 32,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'Haseeb Arshad',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w900,
                      // fontFamily: 'RobotoCondensed',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // UserAccountsDrawerHeader(
          //   accountName: ,
          // ),
          // =====================================
          //              FOR SPACING
          // =====================================
          SizedBox(
            height: 20.0,
          ),
          // =====================================
          // List of Items want to store in drawer
          // =====================================
          buildListTile(
            'Profile',
            Icon(Icons.person),
                (){},
          ),
          // =====================================
          // List of Items want to store in drawer
          // =====================================
          buildListTile(
            'My ads',
            Icon(Icons.list),
                (){},
          ),
          buildListTile(
            'Favorites',
            Icon(Icons.favorite),
                (){},
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.gavel,),
            title: Text(
              'Bidding',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'JameelNooriNastalerq',
                color: Colors.black54,
              ),
            ),
            onTap: (){},
          ),
          buildListTile(
            'General Sales',
            Icon(Icons.list_alt),
                (){},
          ),
          Divider(
            thickness: 2.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text('Sell Your Animal',style: TextStyle(
                color: Colors.green,
                fontSize: 24.0,
              ),),
            ),
          ),
          buildListTile(
            'Sell Animal',
            Icon(Icons.add_circle_outline),
                (){},
          ),
          buildListTile(
            'Logout',
            Icon(Icons.logout),
                (){},
          ),
        ],
      ),
    );
  }
}