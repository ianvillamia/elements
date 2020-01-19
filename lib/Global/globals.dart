import 'package:flutter/material.dart'; 
class Globals{

drawDrawer(){
  return 
Drawer(child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          
          DrawerHeader(
            child: Text('Header'),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),

          ListTile(
            title: Text('Item'),
            onTap: (){},
          ),
            ListTile(
            title: Text('Item'),
            onTap: (){},
          ),
            ListTile(
            title: Text('Item'),
            onTap: (){},
          )

        ],
      ),
  );
}

}