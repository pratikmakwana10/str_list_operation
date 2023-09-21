import 'package:flutter/material.dart';
import 'package:str_list_operation/model.dart';

class ListOperation extends StatefulWidget {
  const ListOperation({Key? key}) : super(key: key);

  @override
  State<ListOperation> createState() => _ListOperationState();
}

class _ListOperationState extends State<ListOperation> {
  List<String> testList = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List<String> userAdd = [];
  TextEditingController empController = TextEditingController();
  TextEditingController salaryCon = TextEditingController();
  TextEditingController positionCon = TextEditingController();
  List<Employee> filteredList = [];

  List<Employee> employeeDetail = [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        title: Text("Employee"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              textFormField("Employee Name", empController),
              textFormField("salary", salaryCon),
              textFormField("Position", positionCon),
              clickButton(),
              Column(children: [
                listViewBuilder(),
              ]),
              if (filteredList.isNotEmpty)
                Column(
                    children: filteredList
                        .map(
                          (singleEmployee) => Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.blueGrey.shade900,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        singleEmployee.empName
                                                .substring(0, 1)
                                                .toUpperCase() +
                                            singleEmployee.empName
                                                .substring(1)
                                                .toLowerCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey.shade400),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10),
                                      child: Text(
                                        "=>",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey.shade400),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: Text(
                                        singleEmployee.salary,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey.shade400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList()),
            ],
          ),
        ),
      ),
    );
  }

  InkWell clickButton() {
    return InkWell(
      onTap: () {
        testList.insert(2, "500");
        //  print(testList[2]);

        testList.insertAll(5, ["100", "200", "300"]);
        //  print(testList[5]);

        testList.addAll(["jack", "jimmy", "jones"]);
        // print(testList);

        var hy = planet.indexOf("earth");
        // print(hy);

        employeeDetail.add(
            Employee(empController.text, salaryCon.text, positionCon.text));
        filteredList = employeeDetail
            .where((element) => int.parse(element.salary) > 9000)
            .toList();

        setState(() {});
        // userAdd.add(addEntry.text);
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.blue.shade900,
        height: 50,
        width: double.maxFinite,
        child: Center(
            child: Text(
          "Click".toUpperCase(),
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }

  Container listViewBuilder() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: employeeDetail.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              isThreeLine: true,
              leading: Text(employeeDetail[index].salary),
              title: Text(employeeDetail[index].empName),
              subtitle: Text(employeeDetail[index].position),
              trailing: TextButton(
                onPressed: () {
                  employeeDetail.removeAt(index);
                  employeeDetail.remove(employeeDetail[index]);
                  setState(() {});
                },
                child: Icon(
                  Icons.delete,
                ),
              ),
            );
          }),
    );
  }

  Padding textFormField(String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey.shade400),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.deepPurple.shade200, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.deepPurple.shade500, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}
