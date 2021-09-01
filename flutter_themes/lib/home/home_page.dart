import 'package:flutter/material.dart';
import 'package:flutter_themes/app_theme.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppTheme _appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizzaria'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              child: Image.asset(
                'assets/pizza.png',
                height: 100,
              ),
              decoration: _appTheme.pizzaContainer(),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pizza de peperonni com borda de catupiry',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'R\$ 35',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: _appTheme.accent,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer''',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          height: 1.4,
                        ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _iconInfo(Icons.star, '4.5'),
                      _iconInfo(Icons.timer, '20 min'),
                      _iconInfo(Icons.local_fire_department, '350 kcal'),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Fazer pedido'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _iconInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: _appTheme.accent,
        ),
        SizedBox(width: 4.0),
        Text(text),
      ],
    );
  }
}
