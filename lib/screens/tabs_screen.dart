import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  int _selectScreenIndex = 0;
  late List<Map<String, dynamic>> _screens;

  @override
  void initState() {
    super.initState();
      _screens = [
      {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
      {
        'title': 'Meus Favoritos', 
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }
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
      drawer: MainDrawer(),
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