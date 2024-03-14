import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'my_home_page.dart';

class ConfirmDeleteEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 1) / 2;
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
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: cardWidth / 45,
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
        // Fondo Opacado
        Container(
          color: Colors.black.withOpacity(0.6),
          width: double.infinity,
          height: double.infinity,
        ),
        // Modal de confirmación
        Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 300,
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
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2196F3)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          ),
                        ),
                        child: Text(
                          'Aceptar',
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
      MaterialPageRoute(builder: (context) => MyHomePage(title: "APP ALARM")),
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
                      Icons.edit,
                      size: 35,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.delete,
                      size: 35,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '$title',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
