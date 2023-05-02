import 'package:color_palette/modals/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/providers/color_provider.dart';
import '../../controller/providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ColorPalette colorPalette;
  @override
  Widget build(BuildContext context) {
    Provider.of<ColorProvider>(context, listen: false).loadData();
    colorPalette = Provider.of<ColorProvider>(context).colorPalette;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Color Palette",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: Icon(
              (Provider.of<ThemeProvider>(context).isDark)
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            customContainer(color: colorPalette.color100, isFirst: true),
            customContainer(color: colorPalette.color200),
            customContainer(color: colorPalette.color400),
            customContainer(color: colorPalette.color600),
            customContainer(color: colorPalette.color800),
            customContainer(color: colorPalette.color900, isLast: true),
            const Spacer(),
            OutlinedButton.icon(
              icon: const Icon(Icons.color_lens),
              label: const Text("Change Color"),
              onPressed: () {
                Provider.of<ColorProvider>(context, listen: false)
                    .changeColorPalette();
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  customContainer({bool? isFirst, bool? isLast, required String color}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular((isFirst != null) ? 20 : 0),
          topRight: Radius.circular((isFirst != null) ? 20 : 0),
          bottomRight: Radius.circular((isLast != null) ? 20 : 0),
          bottomLeft: Radius.circular((isLast != null) ? 20 : 0),
        ),
        color: Color(int.parse(color)),
      ),
    );
  }
}
