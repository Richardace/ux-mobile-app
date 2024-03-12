import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'my_home_page.dart';

class ConfirmDeleteEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 1) / 2; // Ajusta el ancho según tus necesidades
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            title: 'APP ALARM',
            logo: Image.asset(
              'assets/logoAppAlarm.png',
              width: 50,
              height: 50,
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Agregar nuevo evento:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0,
                    ),
                    Text(
                      '22 de Febrero del 2024',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true, // Para ajustar el tamaño del GridView al contenido
                physics: NeverScrollableScrollPhysics(), // Para deshabilitar el desplazamiento del GridView
                crossAxisCount: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: cardWidth / 45, // Ajustar según tus necesidades
                children: [
                  _buildCardLarge("9 A.M.", Color(0xFF495DCE), 4, 'Daily'),
                  _buildCardLarge("10 A.M.", Color(0xFF495DCE), 4, 'Sprint Planning'),
                  _buildCardLarge("11 A.M.", Color(0xFF495DCE), 4, 'Sprint Review'),
                  _buildCardLarge("2 P.M.", Color(0xFF495DCE), 4, 'Seguimiento Proyecto'),
                ],
              ),
            ],
          ),
        ),
        // Elemento que opaca la vista
        Container(
          color: Colors.black.withOpacity(0.6), // Color negro semi-transparente
          width: double.infinity,
          height: double.infinity,
        ),
        // Modal de confirmación
        Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 300, // Ancho máximo deseado para el modal
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '¡ Confirmación !',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Evento eliminado con éxito',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => _navigateToHome(context),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2196F3)), // Color de fondo azul
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // Bordes semicirculares
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10), // Ajustar el padding según sea necesario
                          ),
                        ),
                        child: Text(
                          'Guardar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: "AppAlarm")), // Cambia 'NewScreen()' por el nombre de tu nueva pantalla
    );
  }

  Widget _buildCardLarge(String title, Color background, int number, String information) {
    return Card(
      color: background,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  information,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.edit, // Icono de Material
                      size: 35, // Tamaño del icono
                      color: Colors.white, // Color del icono
                    ),
                    Icon(
                      Icons.delete, // Icono de Material
                      size: 35, // Tamaño del icono
                      color: Colors.white, // Color del icono
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '$title',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white, // Color blanco
                fontWeight: FontWeight.normal, // Negrita
              ),
            ),
          ],
        ),
      ),
    );
  }
}
