import 'package:flutter/material.dart';

class SkillSelector extends StatefulWidget {
  const SkillSelector({super.key});

  @override
  State<SkillSelector> createState() => _SkillSelectorState();
}

class _SkillSelectorState extends State<SkillSelector> {
  String? selectedOption = 'Flutter';
  final List<String> options = ['Flutter', 'Kotlin', 'Java', 'Web'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: 
        BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3
            ),
          ],
        ),
      child: 
        DropdownButton<String>(
          dropdownColor: Colors.white,
          value: selectedOption,
          icon: const Icon(Icons.arrow_drop_down),
          underline: const SizedBox.shrink(),
          isExpanded: true,
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (String? lenguaje) {
            setState(() {
              selectedOption = lenguaje;
              switch (lenguaje) {
                case 'Flutter':
                  {
                    showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.grey,
                        title: const Text('Flutter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Image.asset('assets/images/img_flutter.jpg'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Cerrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                case 'Kotlin':
                  {
                    showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.green,
                        title: const Text(
                          'Kotlin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Image.asset('assets/images/img_kotlin.jpg'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Cerrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                case 'Java':
                  {
                    showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.orange,
                        title: const Text(
                          'Java',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Image.asset('assets/images/img_java.jpg'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Cerrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                case 'Web':
                  {
                    showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.black,
                        title: const Text( 'Web',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Image.asset('assets/images/img_web.jpg'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Cerrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              }
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Lenguaje selecionado: $lenguaje',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 2),
            ),
          );
        },
      ),

    );
  }
}
