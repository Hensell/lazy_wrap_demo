import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lazy_wrap/lazy_wrap.dart';

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
      ),
      home: const MyHomePage(title: 'Lazy Wrap with 999,999 elements!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final random = Random();

  double borderRadiusValue = 15;
  bool useDynamicMeasurement = true;

  final Map<int, double> widthCache = {};
  final Map<int, double> heightCache = {};

  double randomWidth() => 80 + random.nextInt(150).toDouble(); // 80–230
  double randomHeight() => 60 + random.nextInt(120).toDouble(); // 60–180

  double cachedWidth(int index) =>
      widthCache.putIfAbsent(index, () => randomWidth());

  double cachedHeight(int index) =>
      heightCache.putIfAbsent(index, () => randomHeight());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  const Text("Border:"),
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
                  const SizedBox(width: 8),
                  Text(borderRadiusValue.toStringAsFixed(0)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  const Text("Fixed mode:"),
                  const SizedBox(width: 8),
                  Switch(
                    value: !useDynamicMeasurement,
                    onChanged: (val) {
                      setState(() {
                        useDynamicMeasurement = !val;
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  Text(
                    useDynamicMeasurement
                        ? 'Dynamic sizing (random)'
                        : 'Fixed sizing (estimated)',
                    style: const TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: LazyWrap(
                rowAlignment: MainAxisAlignment.center,
                useDynamicMeasurement: useDynamicMeasurement,
                itemCount: 999999,
                spacing: 12,
                runSpacing: 12,
                estimatedItemWidth: 120,
                estimatedItemHeight: 100,
                itemBuilder: (context, index) {
                  final baseColor = Colors
                      .primaries[index % Colors.primaries.length]
                      .shade400;
                  final textColor =
                      ThemeData.estimateBrightnessForColor(baseColor) ==
                          Brightness.dark
                      ? Colors.white
                      : Colors.black;

                  if (useDynamicMeasurement) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      width: cachedWidth(index),
                      height: cachedHeight(index),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadiusValue),
                        color: baseColor,
                        boxShadow: [
                          BoxShadow(
                            color: baseColor.withValues(alpha: 0.5),
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
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
                  } else {
                    return Container(
                      width: cachedWidth(index),
                      height: cachedHeight(index),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadiusValue),
                        color: baseColor,
                        boxShadow: [
                          BoxShadow(
                            color: baseColor.withValues(alpha: 0.5),
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
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
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
