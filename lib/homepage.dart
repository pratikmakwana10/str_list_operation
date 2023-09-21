import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:str_list_operation/whale.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController number = TextEditingController();
  String userName = '';
  String lastName = '';
  String splt = 'today is friday !!';
  List<String> userList = [];
  List<String> planet = [
    'Mercury',
    'Earth',
    'Venus',
    'Jupiter',
    'pluto',
    'Neptune',
    'Uranus',
    'Saturn',
    'Sun'
  ];
  String splitout = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          backgroundColor: Colors.purple.shade100,
          centerTitle: true,
          title: const Text("Operation"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Whale()),
                  );
                },
                icon: const Icon(Icons.ac_unit_outlined, size: 30),
                color: Colors.deepPurple,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            sizedBox25(),
            buildCircleAvatar(),
            sizedBox25(),
            buildTextFormField("Enter Your Name", name),
            sizedBox25(),
            buildTextFormField("Enter your last Name", surName),
            sizedBox25(),
            buildTextFormField("Enter your cell No.", number),
            sizedBox25(),
            containerResult(
              Colors.deepPurple.shade200,
              "Concatenation :  $userName$lastName",
            ),
            buildSizedBox10(),
            containerResult(
              Colors.deepPurple.shade300,
              "Trimmed - ${lastName.trim().toLowerCase()}",
            ),
            buildSizedBox10(),
            containerResult(Colors.deepPurple.shade400,
                "UpperCase - ${lastName.toUpperCase()}"),
            buildSizedBox10(),
            containerResult(
              Colors.deepPurple.shade500,
              "THE Lengh of last name = ${lastName.length.toString()}",
            ),
            buildSizedBox10(),
            containerResult(
              Colors.deepPurple.shade500,
              userName.contains("j").toString(),
            ),
            buildSizedBox10(),
            buildRow(),
            buildSizedBox10(),
            containerResult(
              Colors.deepPurple.shade700,
              "split =$splitout",
            ),
            buildSizedBox10(),
            containerResult(
              Colors.deepPurple.shade800,
              splitout,
            ),
            buildSizedBox10(),
            buttonClick(),
          ]),
        ));
  }

  Container containerResult(Color color, String text) {
    return Container(
      height: 50,
      width: double.maxFinite,
      color: color,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 12),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 50,
          color: Colors.deepPurple.shade500,
          child: Center(
            child: Text(
              "isNotEmpty -${userName.isNotEmpty.toString()}",
              //userName.isNotEmpty.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 170,
          height: 50,
          padding: const EdgeInsets.only(right: 20, left: 20),
          color: Colors.deepPurple.shade500,
          child: Center(
            child: Text(
              "isEmpty -${userName.isEmpty.toString()}",
              //userName.isNotEmpty.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  CircleAvatar buildCircleAvatar() {
    return CircleAvatar(
      backgroundColor: Colors.deepPurple.shade200,
      minRadius: 30,
      // radius: 30,
      child: Text(
        userName == "" || lastName == ""
            ? ""
            : '${userName.substring(0, 1).toUpperCase()}${lastName.substring(0, 1).toUpperCase().trim()}',
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container buttonClick() {
    return Container(
      padding: const EdgeInsets.only(top: 05, bottom: 5),
      // color: Colors.blue.shade900,
      height: 50,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {
          userName = name.text;
          lastName = surName.text;
          splitout = splt.split(" ").toString();
          if (kDebugMode) {
            print(splitout);
          }

// indexOf String
          //   print(plm);
          var ghj = planet.indexOf('pluto'); // indexOf List
          if (kDebugMode) {
            print("index List-- $ghj");
          }
          var poi =
              splt.lastIndexOf("y"); // String splt = 'today is friday !!';
          if (kDebugMode) {
            print("LastIndexOf String${{poi}}");
          }

          //   print(pok);
          //    print(pkn);

          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple[900], //ripple color
        ),
        child: Text(
          "Click".toUpperCase(),
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  SizedBox buildSizedBox10() => const SizedBox(
        height: 5,
      );

  BoxDecoration containerBoxDecoration() {
    return BoxDecoration(
      color: Colors.deepPurple.shade900,
      border: Border.all(
          color: Colors.deepPurple.shade700,
          style: BorderStyle.solid), //Border.all
      borderRadius: const BorderRadius.all(
        Radius.circular(0),
      ),
    );
  }

  TextFormField buildTextFormField(
      String hintText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey.shade400),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade200, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade500, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }

  SizedBox sizedBox25() => const SizedBox(
        height: 25,
      );
}
