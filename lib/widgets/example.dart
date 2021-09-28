import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String text = 'Ни одна кнопка не нажата';

  void printFirst() {
    setState(() {
      text = 'Нажата или первая или вторая кнопка';
    });
  }

  void printSecond() {
    setState(() {
      text = 'Нажата третья кнопка';
    });
  }

  void printLast() {
    setState(() {
      text = 'Нажата последняя кнопка';
    });
  }

  void printLongPress() {
    setState(() {
      text = 'Было долгое нажатие на одну из кнопок';
    });
  }

  final style = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.red), // фон кнопки
    foregroundColor: MaterialStateProperty.all(Colors.black), // стиль кнопки
    overlayColor: MaterialStateProperty.all(Colors.green), // при нажатии волны
    shadowColor: MaterialStateProperty.all(Colors.blue), //  цвет сплеша
    //elevation: MaterialStateProperty.all(10), // высота кнопки над плоскостью
    // padding: MaterialStateProperty.all(EdgeInsets.all(0)), // отступ
    // minimumSize: MaterialStateProperty.all(Size(50, 100)), // минимальный размер
    // shape: MaterialStateProperty.all(
    //   RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(50.0), // радиус скругления
    //     side: BorderSide(color: Colors.black), // рамки
    //   ),
    // ),
    //alignment: Alignment.topLeft, // смещение элемента
    //visualDensity: VisualDensity(horizontal: 3, vertical: 2), // плотность
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          ElevatedButton(
            clipBehavior: Clip
                .antiAlias, // обрезает ли кнопка контент который находится внутри нее
            style: style,
            onPressed: printFirst,
            onLongPress: printLongPress,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.ac_unit),
                SizedBox(width: 10),
                Text('Нажми меня!'),
                SizedBox(width: 10),
                Icon(Icons.ac_unit),
              ],
            ),
          ),
          OutlinedButton(
            style: style,
            onPressed: printFirst,
            onLongPress: printLongPress,
            child: Text('Нажми меня!'),
          ),
          TextButton(
            style: style,
            onPressed: printSecond,
            onLongPress: printLongPress,
            child: Text('Нажми меня!'),
          ),
          IconButton(
            //iconSize: 24,
            // padding: EdgeInsets.all(40),
            // alignment: Alignment.topCenter,
            splashRadius: 24,
            splashColor: Colors.red,
            highlightColor: Colors.green,
            disabledColor: Colors.pink,
            onPressed: printLast,
            icon: Icon(Icons.ac_unit),
          ),
        ],
      ),
    );
  }
}
