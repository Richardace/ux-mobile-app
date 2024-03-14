import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'viewreuniones.dart';
import 'my_home_page.dart';

class MyHomePageWithMessageConfirmation extends StatefulWidget {
  const MyHomePageWithMessageConfirmation({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePageWithMessageConfirmation> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageWithMessageConfirmation> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 1) / 2;
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        logo: Image.asset(
          'assets/logoAppAlarm.png',
          width: 50,
          height: 50,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bievenido Richardace',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Text(
                      'Rutinas Programadas para hoy',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: cardWidth / 100,
                children: [
                  _buildCard("Reuniones", Color(0xFF495DCE), 4, 'assets/Reunion.png', true),
                  _buildCard("Entregas", Color(0xFF025EA6), 1, 'assets/Entregas.png', false),
                  _buildCard("Pausas Activas", Color(0xFF3CA9FF), 2, 'assets/Pausa Activa icon.png', false),
                  _buildCard("Otros", Color(0xFF757576), 6, 'assets/Otros.png', false),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Proximos Eventos - 13',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
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
                  _buildCardLarge("Daily", Color(0xFF495DCE), 4, '22-02-2024 - Reunión'),
                ],
              ),
            ],
          ),
          // Modal de confirmación
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
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
                        'Evento añadido con éxito',
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToHome(context),
        tooltip: 'Increment',
        child: Image.asset(
          "assets/logoAdd.png",
          width: 85,
          height: 85,
        ),
      ),
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  information,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  '$number',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            Text(
              '$title',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, Color background, int number, String pathIcon, bool redirigir) {
    return GestureDetector(
      onTap: () {
        if (redirigir) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewReuniones()),
          );
        }
      },
      child: Card(
        color: background,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    pathIcon,
                    width: 35,
                    height: 35,
                  ),
                  Text(
                    '$number',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                '$title',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
