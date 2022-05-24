import 'package:flutter/material.dart';
import 'package:vehicle_registration_checker/license_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicle_registration_checker/update_numbers.dart';

class registeredNumbers extends StatefulWidget {
  const registeredNumbers({ Key? key }) : super(key: key);

  @override
  State<registeredNumbers> createState() => _registeredNumbersState();
}

class _registeredNumbersState extends State<registeredNumbers> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
          toolbarHeight: 70,
        title: const Text (
          "All Registration Numbers",
          style: TextStyle (
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),

      body:
      Container(
        decoration: const BoxDecoration (
              gradient: LinearGradient (
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight, 
                  colors: [
                      Color.fromARGB(226, 214, 232, 223),
                      Color.fromARGB(194, 253, 253, 253),
                  ],
              )
          ),
        child: StreamBuilder <List<License>>(           //streambuilder displaying a list of the data saved in License object 
              stream: readNumbers(),
              builder: (context, snapshot) {
                  if (snapshot.hasError) {
                      return const Text ("There is no data to be shown");       // error call if the database is empty or has an error
                  } else if(snapshot.hasData) {
                      final licenseNumbers = snapshot.data!;
                      return Column(
                          children: [
                              Expanded (
                                  child: ListView (
                                      children :  licenseNumbers.map(optionButton).toList(),
                                  ), 
                              ),
                          ],
                      );
                  } else {
                      return 
                      const Center(
                          child: Text("There is no data to be shown"),
                      );
                  }
              }
          ),
      ),
    );
  }
  
  Widget optionButton (License license) => ListTile (
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(license.license),
        ), 
        trailing: PopupMenuButton (
            itemBuilder: (context) => [
                PopupMenuItem ( 
                    child: const Text("Edit"),
                    onTap: () => const updateLicense(),
                    //  {
                    //     Navigator.push(context,MaterialPageRoute(
                    //       builder: (context) => const updateLicense()
                    //         )
                    //     );
                    // },
                ),
                PopupMenuItem (
                    child: const Text ("Delete"),
                    onTap: () {

                    },
                ),
            ], 
         ),
    );

  Stream<List<License>> readNumbers() => FirebaseFirestore.instance
    .collection('registered-numbers')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) =>License.fromJson(doc.data())).toList());
} 