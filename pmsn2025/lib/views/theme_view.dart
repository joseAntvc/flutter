import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/sesion_values.dart';
import 'package:pmsn2025/utils/theme_settings.dart';
import 'package:pmsn2025/views/font_tile_view.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {

  Map<String, Color> colors = {
  };

  @override
  void initState() {
    super.initState();
    loadCustomColors().then((c) {
      setState(() {
        colors = c;
      });
    });
  }

  void pickColor(String key) async {
    Color pickedColor = colors[key]!;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Selecciona un color para $key'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickedColor,
            onColorChanged: (color) {
              pickedColor = color;
            },
          ),
        ),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('Aceptar'),
            onPressed: () {
              colors[key] = pickedColor;
              Navigator.pop(context);
              updateCustomTheme();
            },
          ),
        ],
      ),
    );
  }

  void updateCustomTheme() {
    ThemeSettings.updateCustomTheme(
      colors['Botones']!,
      colors['Ventanas']!,
      colors['Texto']!,
      colors['Barra principal']!,
      colors['Texto de la barra']!,
    );
    GlobalValues.themeApp.value = ThemeSettings.custom();
    saveCustomColors(
      colors['Botones']!,
      colors['Ventanas']!,
      colors['Texto']!,
      colors['Barra principal']!,
      colors['Texto de la barra']!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ValueListenableBuilder(
        valueListenable: GlobalValues.themeApp,
        builder: (context, themeV, child) {
          return ValueListenableBuilder(
            valueListenable: GlobalValues.fontApp,
            builder: (context, fontV, child) {
              return ListView(
                padding: EdgeInsets.only(top: 0),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    decoration: BoxDecoration(color: Color(0xFF18396a)),
                    child: Text('Selecciona un tema', style: TextStyle(color: Colors.white, fontSize: 30), textAlign: TextAlign.center,),
                  ),
                  ListTile(
                    leading: Icon(Icons.light_mode_rounded),
                    title: Text('Tema oscuro'),
                    iconColor: themeV == ThemeData.dark() ?  Colors.white : null,
                    textColor: themeV == ThemeData.dark() ?  Colors.white : null,
                    tileColor: themeV == ThemeData.dark() ? Colors.blue[300] : null, // Resaltar el tema activo
                    onTap: themeV == ThemeData.dark() ? null : () {
                      GlobalValues.themeApp.value = ThemeData.dark();
                      saveTheme('dark');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.dark_mode_rounded),
                    title: Text('Tema claro'),
                    iconColor: themeV == ThemeData.light() ? Colors.white : null,
                    textColor: themeV == ThemeData.light() ? Colors.white : null,
                    tileColor: themeV == ThemeData.light() ? Colors.blue[300] : null, // Resaltar el tema activo
                    onTap: themeV == ThemeData.light() ? null : () {
                      GlobalValues.themeApp.value = ThemeData.light();
                      saveTheme('light');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.brightness_6),
                    title: Text('Personalizado'),
                    iconColor: themeV == ThemeSettings.custom() ? Colors.white : null,
                    textColor: themeV == ThemeSettings.custom() ? Colors.white : null,
                    tileColor: themeV == ThemeSettings.custom() ? Colors.blue[300] : null, // Resaltar el tema activo
                    onTap: themeV != ThemeData.light() && themeV != ThemeData.dark() ? null : () {
                      GlobalValues.themeApp.value = ThemeSettings.custom();
                      saveTheme('custom');
                    },
                  ),
                  if(themeV == ThemeSettings.custom())
                    ...colors.entries.map((color) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: ListTile(
                          title: Text(color.key),
                          trailing: GestureDetector(
                            onTap: () => pickColor(color.key),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color.value,
                                border: Border.all(color: Colors.black, width: 1),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  Divider(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tipografía', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        Icon(Icons.abc_rounded),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  FontTileView(fontName: 'Roboto', selectedFont: fontV),
                  FontTileView(fontName: 'Hiatus', selectedFont: fontV),
                  FontTileView(fontName: 'Montserrat-Regular', selectedFont: fontV),
                  FontTileView(fontName: 'SWar', selectedFont: fontV),
                ],
              );
            }
          );
        }
      ),
    );
  }
}