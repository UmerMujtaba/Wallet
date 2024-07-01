import 'package:flutter/material.dart';

class AddCardScreen2 extends StatefulWidget {
  const AddCardScreen2({Key? key}) : super(key: key);

  @override
  State<AddCardScreen2> createState() => _AddCardScreen2State();
}

class _AddCardScreen2State extends State<AddCardScreen2> {
  TextEditingController NameController = TextEditingController();
  TextEditingController BankController = TextEditingController();
  TextEditingController AccountController = TextEditingController();

  TextEditingController ValidityController = TextEditingController();
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
            size: 25,
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const Text(
                'Add Card Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              //Name
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 5, 0, 0),
                    child: Text(
                      'Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextField(
                  controller: NameController,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.text_fields, size: 24),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Enter Name of Account Holder',
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),

              //Bank
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 5, 0, 0),
                    child: Text(
                      'Bank',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextField(
                  controller: BankController,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.account_balance, size: 24),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Enter Bank Name',
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),

              //Account
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 5, 0, 0),
                    child: Text(
                      'Account No',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextField(
                  controller: AccountController,
                  keyboardType: TextInputType.number,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.numbers, size: 24),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Enter Account No',
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),

              //Status
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 5, 0, 0),
                    child: Text(
                      'Status',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Active'),
                    Radio<int>(
                      value: 1,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    const Text('Inactive'),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/show-card');
                },
                style: ElevatedButton.styleFrom(
                  padding:  EdgeInsets.fromLTRB(40, 15, 40, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  backgroundColor: Colors.blue[800],
                ),
                child: const Text(
                  'Add Card',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
