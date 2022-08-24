import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class CustomTitleBar extends StatefulWidget with PreferredSizeWidget {
  const CustomTitleBar({Key? key}) : super(key: key);

  @override
  State<CustomTitleBar> createState() => _CustomTitleBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _CustomTitleBarState extends State<CustomTitleBar> {
  final String title = 'Vitalvet';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: SizedBox(
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: MoveWindow(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 11, horizontal: 70),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onDoubleTap: () {
                  appWindow.maximizeOrRestore();
                },
              ),
            ),
            const WindowButtons(),
          ],
        ),
      ),
    );
  }
}

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(),
        appWindow.isMaximized
            ? RestoreWindowButton(onPressed: maximizeOrRestore)
            : MaximizeWindowButton(onPressed: maximizeOrRestore),
        CloseWindowButton()
      ],
    );
  }
}
