import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'confirmDeleteEvent.dart';

class ViewReuniones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 1) / 2; // Ajusta el ancho según tus necesidades
    return Scaffold(
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
                  'Reuniones para hoy:',
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
              _buildCardLarge("9 A.M.", Color(0xFF495DCE), 4, 'Daily', context),
              _buildCardLarge("10 A.M.", Color(0xFF495DCE), 4, 'Sprint Planning', context),
              _buildCardLarge("11 A.M.", Color(0xFF495DCE), 4, 'Sprint Review', context),
              _buildCardLarge("2 P.M.", Color(0xFF495DCE), 4, 'Seguimiento Proyecto', context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardLarge(String title, Color background, int number, String information, BuildContext context) {
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
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.edit,
                        size: 35,
                        color: Colors.white,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConfirmDeleteEvent()),
                          );
                        },
                        child: Icon(
                          Icons.delete,
                          size: 35,
                          color: Colors.white,
                        ),
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
