import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My App : 66130746'),
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
  // กรณี หายอด VAT จากราคาปกติ
  late double textBoxFirst = 0; //ราคาสินค้า/บริการ
  late double resultFirst = 0; //ผลการคำนวณที่จะนำไปแสดงบนหน้าจอ

  // กรณี หายอดก่อน VAT จากยอด VAT
  late double textBoxSecond = 0; //ราคาสุทธิที่รวม VAT
  late double resultSecond = 0; //ผลการคำนวณที่จะนำไปแสดงบนหน้าจอ
  vatBeforeSample() {
    late double result = textBoxSecond * (100 / 107);
    setState(() {
      resultSecond = result;
    });
  }

  vatSample() {
    late double result = textBoxFirst * (7 / 100);
    setState(() {
      resultFirst = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text(
                      "กรณี หายอด VAT จากราคาปกติ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "ราคาสินค้า/บริการ",
                            border: OutlineInputBorder()),
                        onChanged: (value) {
                          setState(() {
                            textBoxFirst = double.parse(value);
                          });
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: vatSample,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(25, 177, 252, 1),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                            'คำนวณ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    Center(
                      child: Text(
                        "ภาษีมูลค่าเพิ่ม ${resultFirst.toString()} บาท",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text(
                      "กรณี หายอดก่อน VAT จากยอด VAT ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "ราคาสุทธิที่รวม Vat",
                            border: OutlineInputBorder()),
                        onChanged: (value) {
                          setState(() {
                            textBoxSecond = double.parse(value);
                          });
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: vatBeforeSample,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(25, 177, 252, 1),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                            'คำนวณ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    Center(
                      child: Text(
                        "ยอดก่อน VAT ${resultSecond.toString()} บาท",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
