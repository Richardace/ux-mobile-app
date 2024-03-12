import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget logo;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          logo, // Logotipo a la izquierda
          const SizedBox(width: 0), // Espacio entre el logotipo y el texto
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, // Color blanco
                fontWeight: FontWeight.bold, // Negrita
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF3CA9FF),
      actions: [
        // Aquí puedes agregar acciones adicionales si es necesario
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
