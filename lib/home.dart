import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images =
  ['assets/image.jpg',
  'assets/bird.jpg',
  'assets/cat1.jpg'];
  static int count = 0;
  String image = 'assets/image.jpg';
  String _text ='' ;
  double _x = -1 , _y = -1 ;
  void updateText()
  {
    setState(() {
      if (_x == -1 || _y == -1 )
        _text = 'Enter all values ';
      else
        {
          image = images [count];
          count = (count + 1 ) % images.length;
        _text = (_x + _y).toString();
      }
    });
  }
  void updatex(String x)
  {
    if (x.trim() == '')
      _x = -1;
    else
      _x = double.parse(x);
  }
  void updatey(String y)
  {
    if (y.trim() == '')
      _y = -1;
    else
      _y = double.parse(y);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            Text('you have typed $_text',style: TextStyle(fontSize: 18.0), ),
            const SizedBox (height: 20.0),
            MyTextFieldWidget(hint: 'Enter x', f: updatex),
            const SizedBox (height: 20.0),
            MyTextFieldWidget(hint: 'Enter y', f: updatey),
            const SizedBox (height: 20.0),
            ElevatedButton(onPressed:(){ updateText();}, 
                child: Text ('Sum is ', style: (TextStyle(fontSize: 26)),)),
            Image.asset(image, width:250.0 ,height:250.0 ,)
          ],
        ),
      ),
    );
  }
}

class MyTextFieldWidget extends StatelessWidget {
  Function(String) f;
  String hint;
   MyTextFieldWidget({required this.hint, required this.f , super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox (width: 300.0, height: 50,
        child: TextField(
          style: const TextStyle(fontSize: 18.0 ),
          decoration: const InputDecoration(
              border: OutlineInputBorder(),hintText: 'Enter your name '
          ),
          onChanged: (text){  f(text);},
        )

    );
  }
}
