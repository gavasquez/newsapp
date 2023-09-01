import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/pages.dart';
import 'package:newsapp/src/pages/tab2_page.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Instanciamos de forma global un provider
    return ChangeNotifierProvider(
      // Crear instancia de la clase del provider
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
        // Cambiar la seleccion del BottomNavigationBar
        // Escuchamos el valor de la pagina actual
        currentIndex: navegacionModel.paginaActual,
        // Cambiar el valor del provider
        onTap: (value) => navegacionModel.paginaActual = value,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Para Ti'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'Encabezados')
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      // Navegacion
      controller: navegacionModel.pageController,
      // Efecto al no tener mas paginas physics: BouncingScrollPhysics()
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tap2Page(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual {
    return this._paginaActual;
  }

  set paginaActual(int valor) {
    this._paginaActual = valor;
    // Cambia la pagina
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
