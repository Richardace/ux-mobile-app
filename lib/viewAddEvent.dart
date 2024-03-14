import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'confirmAdd.dart';

class ViewAddEvent extends StatefulWidget {
  @override
  _ViewAddEventState createState() => _ViewAddEventState();
}

class _ViewAddEventState extends State<ViewAddEvent> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<String> opcionesTipo = ["Pausa Activa", "Reuniones", "Otros", "Entregas"];
    List<String> opcionesRepetir = ["Una vez", "Diariamente", "Semanalmente", "Mensualmente"];
    List<String> opcionesSonido = ["Paraiso", "Cascada", "Grito"];
    return Scaffold(
      appBar: CustomAppBar(
        title: 'APP ALARM',
        logo: Image.asset(
          'assets/logoAppAlarm.png',
          width: 50,
          height: 50,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Agregar nuevo evento',
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titulo Evento',
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFD9D9D9),
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () => _selectDate(context),
                child: IgnorePointer(
                  child: TextFormField(
                    controller: TextEditingController(
                      text: selectedDate != null ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}" : '',
                    ),
                    decoration: InputDecoration(
                      labelText: 'Fecha',
                      border: OutlineInputBorder(),
                      fillColor: Color(0xFFD9D9D9),
                      filled: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () => _selectTime(context),
                child: IgnorePointer(
                  child: TextFormField(
                    controller: TextEditingController(
                      text: selectedTime != null ? "${selectedTime!.hour}:${selectedTime!.minute}" : '',
                    ),
                    decoration: InputDecoration(
                      labelText: 'Hora',
                      border: OutlineInputBorder(),
                      fillColor: Color(0xFFD9D9D9),
                      filled: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Tipo',
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFD9D9D9),
                  filled: true,
                ),
                items: opcionesTipo.map((opcion) {
                  return DropdownMenuItem(
                    value: opcion,
                    child: Text(opcion),
                  );
                }).toList(),
                onChanged: (value) {
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Repetir',
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFD9D9D9),
                  filled: true,
                ),
                items: opcionesRepetir.map((opcion) {
                  return DropdownMenuItem(
                    value: opcion,
                    child: Text(opcion),
                  );
                }).toList(),
                onChanged: (value) {
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Sonido',
                  border: OutlineInputBorder(),
                  fillColor: Color(0xFFD9D9D9),
                  filled: true,
                ),
                items: opcionesSonido.map((opcion) {
                  return DropdownMenuItem(
                    value: opcion,
                    child: Text(opcion),
                  );
                }).toList(),
                onChanged: (value) {
                },
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () => _navigateToConfirmEvent(context),
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
                  child: Text('Guardar',
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
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void _navigateToConfirmEvent(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePageWithMessageConfirmation(title: "AppAlarm")),
    );
  }
}
