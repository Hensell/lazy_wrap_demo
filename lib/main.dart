import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lazy_wrap/lazy_wrap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lazy Wrap Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        fontFamily: 'Roboto',
      ),
      home: const HomeMenu(),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFECF2F7),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.auto_awesome,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 24),
              const Text(
                "Lazy Wrap Demo",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 32,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "A Flutter grid that can scroll millions of items efficiently. Choose a mode to start:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.55),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 42),
              SizedBox(
                width: 350,
                child: Column(
                  children: [
                    MenuButton(
                      icon: Icons.grid_on,
                      color: Colors.teal,
                      title: "Fixed mode",
                      description:
                          "All items are the same estimated size. Ultra fast.",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const GridScreen(isDynamic: false),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    MenuButton(
                      icon: Icons.auto_awesome,
                      color: Colors.amber,
                      title: "Dynamic mode",
                      description:
                          "Each item gets a unique, random size. Great for cards.",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const GridScreen(isDynamic: true),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),

              TextButton(
                onPressed: _launchURL,
                child: Text(
                  "Made by @Henselldev",
                  style: TextStyle(
                    color: theme.colorScheme.primary.withOpacity(0.44),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final Uri _url = Uri.parse('https://hensell.dev');

Future<void> _launchURL() async {
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw Exception('No se pudo abrir $_url');
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: color.withOpacity(0.07),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.24), width: 1.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            children: [
              Icon(icon, size: 34, color: color),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.black87.withOpacity(0.64),
                        fontSize: 13.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridScreen extends StatefulWidget {
  final bool isDynamic;

  const GridScreen({super.key, required this.isDynamic});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  final random = Random();

  double borderRadiusValue = 18;
  Axis scrollDirection = Axis.vertical;
  bool isLoading = false; // <-- flag para overlay

  // Caches for dynamic sizing
  final Map<int, double> widthCache = {};
  final Map<int, double> heightCache = {};

  double randomWidth() => 40 + random.nextInt(75).toDouble(); // 80–230
  double randomHeight() => 30 + random.nextInt(60).toDouble(); // 60–180

  double cachedWidth(int index) =>
      widthCache.putIfAbsent(index, () => randomWidth());

  double cachedHeight(int index) =>
      heightCache.putIfAbsent(index, () => randomHeight());

  void _switchDirection(bool isHorizontal) async {
    setState(() {
      isLoading = true;
    });
    // Espera el rebuild (puedes tunear la duración)
    await Future.delayed(const Duration(milliseconds: 450));
    setState(() {
      scrollDirection = isHorizontal ? Axis.horizontal : Axis.vertical;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FA),
      appBar: AppBar(
        titleSpacing: 8,
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
        elevation: 1.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.isDynamic ? "Dynamic Mode" : "Fixed Mode"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Tooltip(
              message: 'Toggle scroll direction',
              child: Row(
                children: [
                  Icon(
                    scrollDirection == Axis.horizontal
                        ? Icons.swap_horiz
                        : Icons.swap_vert,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  Switch.adaptive(
                    value: scrollDirection == Axis.horizontal,
                    onChanged: (isHorizontal) {
                      _switchDirection(isHorizontal);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Slider y descripción
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.isDynamic
                      ? "✨ Dynamic: Variable-size cards (random for demo)"
                      : "🚀 Fixed: All items same size (fastest)",
                  style: const TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Try scrolling ${scrollDirection == Axis.horizontal ? "→" : "↓"} or switch direction. Border radius applies to all cards.",
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.black87.withOpacity(0.54),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text("Border radius:"),
                    Expanded(
                      child: Slider(
                        min: 0,
                        max: 50,
                        value: borderRadiusValue,
                        onChanged: (val) {
                          setState(() {
                            borderRadiusValue = val;
                          });
                        },
                      ),
                    ),
                    Text(
                      borderRadiusValue.toStringAsFixed(0),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    // Usar el constructor correcto dependiendo del modo
                    if (widget.isDynamic) {
                      return LazyWrap.dynamic(
                        key: ValueKey("dynamic_${scrollDirection.name}"),
                        rowAlignment: MainAxisAlignment.center,
                        itemCount: 999999,
                        spacing: 12,
                        runSpacing: 12,
                        scrollDirection: scrollDirection,
                        itemBuilder: (context, index) {
                          final baseColor = Colors
                              .primaries[index % Colors.primaries.length]
                              .shade400;
                          final textColor =
                              ThemeData.estimateBrightnessForColor(baseColor) ==
                                  Brightness.dark
                              ? Colors.white
                              : Colors.black;
                          return Container(
                            width: cachedWidth(index),
                            height: cachedHeight(index),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                borderRadiusValue,
                              ),
                              color: baseColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${index + 1}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: textColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return LazyWrap.fixed(
                        key: ValueKey("fixed_${scrollDirection.name}"),
                        rowAlignment: MainAxisAlignment.center,
                        itemCount: 999999,
                        spacing: 12,
                        runSpacing: 12,
                        estimatedItemWidth: 80,
                        estimatedItemHeight: 80,
                        scrollDirection: scrollDirection,
                        itemBuilder: (context, index) {
                          final baseColor = Colors
                              .primaries[index % Colors.primaries.length]
                              .shade400;
                          final textColor =
                              ThemeData.estimateBrightnessForColor(baseColor) ==
                                  Brightness.dark
                              ? Colors.white
                              : Colors.black;
                          return Container(
                            width: 120,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                borderRadiusValue,
                              ),
                              color: baseColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Item ${index + 1}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: textColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                // Loader overlay solo cuando cambia el scroll direction
                if (isLoading)
                  Positioned.fill(
                    child: Container(
                      color: Colors.white.withOpacity(0.73),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(
                              color: Colors.teal,
                              strokeWidth: 3,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Switching layout...",
                              style: TextStyle(
                                color: Colors.teal.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
