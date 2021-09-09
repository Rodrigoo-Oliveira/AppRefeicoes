import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';

import 'categories_meals_screen.dart';

import 'favorite_screen.dart';


class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  int _selectScreenIndex = 0;
  final List<Map<String, dynamic>> _screens = [
    {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen()},
  ];

  _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens [_selectScreenIndex] ['title'],
        ),
      ),
      body: _screens [_selectScreenIndex] ['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categoria')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorito')
          ),
        ],
      ),
    );
  }
}