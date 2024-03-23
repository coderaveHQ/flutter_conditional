import 'package:flutter/material.dart';

import 'package:flutter_conditional/flutter_conditional.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {

  const App({ super.key });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  bool firstExpression = true;
  bool secondExpression = true;
  String company = 'scial';

  @override
  Widget build(BuildContext context) {

    final EdgeInsets padding = MediaQuery.of(context).padding;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _toggle,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: const Icon(Icons.toggle_on)
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: padding.left + 16.0,
            top: padding.top + 16.0,
            right: padding.right + 16.0,
            bottom: padding.bottom + 16.0
          ),
          child: Column(
            children: [
              Conditional.single(
                condition: firstExpression,
                widget: const CustomCard(
                  color: Colors.blue, 
                  text: 'FIRST EXPRESSION'
                )
              ),
              Conditional.multiCase(
                cases: <Case>[
                  Case(
                    condition: secondExpression,
                    isActive: false,
                    widget: const CustomCard(
                      color: Colors.green, 
                      text: 'SECOND EXPRESSION 1'
                    )
                  ),
                  Case(
                    condition: secondExpression,
                    widget: const CustomCard(
                      color: Colors.orange, 
                      text: 'SECOND EXPRESSION 2'
                    )
                  )
                ],
                fallback: const CustomCard(
                  color: Colors.green, 
                  text: 'SECOND EXPRESSION FALLBACK'
                )
              ),
              Conditional.multiMatch<String>(
                value: company,
                values: <Value<String>>[
                  const Value<String>(
                    value: 'scial', 
                    widget: CustomCard(
                      color: Colors.pink, 
                      text: 'scial'
                    )
                  ),
                  const Value<String>(
                    value: 'Tesla', 
                    widget: CustomCard(
                      color: Colors.purple, 
                      text: 'Tesla'
                    )
                  )
                ]
              )
            ]
          )
        )
      )
    );
  }

  void _toggle() {
    setState(() {
      firstExpression = !firstExpression;
      secondExpression = !secondExpression;
      company = company == 'scial' ? 'Tesla' : 'scial';
    });
  }
}

class CustomCard extends StatelessWidget {

  final Color color;
  final String text;

  const CustomCard({
    super.key,
    required this.color,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: color
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          color: Colors.white
        ),
      )
    );
  }
}