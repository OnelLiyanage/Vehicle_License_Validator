// Page for updating the the saved values in the database

import 'package:flutter/material.dart';


class updateLicense extends StatefulWidget {
  const updateLicense({ Key? key }) : super(key: key);

  @override
  State<updateLicense> createState() => _updateLicenseState();
}

class _updateLicenseState extends State<updateLicense> {
    TextEditingController updatedValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text (
          "Edit Registration Numbers",
          style: TextStyle (
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),

    //   body:StreamBuilder <List<License>> (
        //   stream:() ,
        //     builder: (context, snapshot) {

        //     },
    //     ) ;
    );
  }
}