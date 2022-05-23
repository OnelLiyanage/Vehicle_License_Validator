// ignore_for_file: camel_case_types

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
      StreamBuilder <List<License>>(
            stream: readUsers(),
            builder: (context, snapshot) {
                if (snapshot.hasError) {
                    return const Text ("There is no data to be shown");
                } else if(snapshot.hasData) {
                    final licenseNumbers = snapshot.data!;
                    return Column(
                        children: [
                            Expanded (
                                child: ListView (
                                    children :  licenseNumbers.map(displayNumbers).toList(),
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
    );
  }
  
  Widget displayNumbers (License license) => ListTile (
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(license.license),
        ), 
        trailing: PopupMenuButton (
            itemBuilder: (context) => [
                PopupMenuItem ( 
                    child: const Text("Edit"),
                    onTap: () => updateLicense(),
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

  Stream<List<License>> readUsers() => FirebaseFirestore.instance
    .collection('registered-numbers')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) =>License.fromJson(doc.data())).toList());
} 

// updateNumber () {
//     Container (
//         child : Column (
//         children: [
//             const Text("Updating value"),
//         ],
//         )
//     );
// }