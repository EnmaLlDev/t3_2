import 'package:flutter/material.dart';
import 'package:t3_2/widgets/skill_selector.dart';
import 'package:t3_2/widgets/cv_item_widget.dart';

void main() {
  runApp(const CvInDartApp());
}

class CvInDartApp extends StatelessWidget {
  const CvInDartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const StructurPage(),
    );
  }
}

class StructurPage extends StatelessWidget {
  const StructurPage({super.key});

  final List<Map<String, String>> _experiencia = const [
    {
      'titulo': 'Desarrollador Junior PlusUltra',
      'subtitulo': 'Empresa XYZ',
      'texto': '2024 - Presente',
    },
    {
      'titulo': 'Domador de Insectos',
      'subtitulo': 'Empresa Y',
      'texto': '2022 - 2023',
    },
    {
      'titulo': 'Encargado de Asuntos poco importantes',
      'subtitulo': 'Empresa Z',
      'texto': '2021 - 2022',
    },
  ];
  final List<Map<String, String>> _formacion = const [
    {
      'titulo': 'Grado Superior DAM',
      'subtitulo': 'IES - Fernando Wirtz',
      'texto': '2024 - Presente',
      'icon': 'school',
    },
    {
      'titulo': 'Certificación en Ciberseguridad',
      'subtitulo': 'CNTG',
      'texto': '2023 - 2024',
      'icon': 'security',
    },
    {
      'titulo': 'Certificación en Bases de datos',
      'subtitulo': 'CNTG',
      'texto': '2023 - 2024',
      'icon': 'storage',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Practica T3.2 Flutter'),
        backgroundColor: Colors.blueGrey,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        focusColor: Colors.white,
        hoverColor: Colors.black,
        onPressed: () {
          showDialog(
            barrierColor: Colors.transparent,
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: const Text('Datos de Contacto', 
                textAlign: TextAlign.center,
                    style: TextStyle( 
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                )),
              content: const Text('Email: mycorreo@gmail.com\nTeléfono: 603035461\nCoruña ', 
                  textAlign: TextAlign.center,
                    style: TextStyle( 
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                )
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cerrar', 
                  style: TextStyle( color: Colors.black)),
                ),
              ],
            ),
          );
        },
        child: 
        const Icon(
          Icons.email,
          color: Colors.white
          ),
      ),
      
      body: 
      LayoutBuilder(
        builder: (context, constraints) {

          final isWideScreen = constraints.maxWidth > 700;

          if (isWideScreen) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(flex: 1, child: InfoPanel()),
                Expanded
                (
                  flex: 2,
                  child: ContentPanel(
                    experiencia: _experiencia,
                    formacion: _formacion,
                  ),
                ),
              ],
            );

          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const InfoPanel(),
                        ContentPanel(
                    experiencia: _experiencia,
                    formacion: _formacion,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(5.0),
        color: Colors.blueGrey,
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage('assets/images/profile.jpg'),
                    backgroundColor: Colors.blueGrey,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'DEV',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Enmanuel Lledo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              'Desarrollador de Software',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: const SkillSelector()
            ),
          ],
        ),
      ),
    );
  }
}

class ContentPanel extends StatelessWidget {
  final List<Map<String, String>> experiencia;
  final List<Map<String, String>> formacion;

  const ContentPanel({
    super.key,
    required this.experiencia,
    required this.formacion,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.all(12.0), // review
      padding: const EdgeInsets.all(20.0),  // review
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.blueGrey),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2 + experiencia.length + formacion.length,
        itemBuilder: (context, index) {
          
          if (index == 0) {
            return cabecera('Experiencia Profesional', Colors.blueGrey);
          } 
          else if (index <= experiencia.length) {
            final item = experiencia[index - 1];
            return CvItemWidget(
              icono: Icons.work,
              titulo: item['titulo']!,
              subtitulo: item['subtitulo']!,
              texto: item['texto']!,
            );
          } 
          else if (index == experiencia.length + 1) {
            return cabecera('Formación', Colors.blueGrey);
          } 
          else {
            final item = formacion[index - (experiencia.length + 2)];
            return CvItemWidget(
              icono: Icons.school,
              titulo: item['titulo']!,
              subtitulo: item['subtitulo']!,
              texto: item['texto']!,
            );
          }
        },
      ),
    );
  }

  Widget cabecera(String title, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                
        const Divider(height: 10, thickness: 1),
      ],
    );
  }
}
