import 'package:flutter/material.dart';

class CvItemWidget extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String subtitulo;
  final String texto;

  const CvItemWidget({
    super.key,
    required this.icono,
    required this.titulo,
    required this.subtitulo,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      
      child:
       Row(
        children: [
          Icon(icono, color: Colors.grey, size: 40),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(subtitulo, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Text(
            texto,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}