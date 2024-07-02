import 'package:flutter/material.dart';
import 'package:wallet/screens/show_Card.dart';

class AddCardScreen2 extends StatefulWidget {
  const AddCardScreen2({super.key});

  @override
  State<AddCardScreen2> createState() => _AddCardScreen2State();
}

class _AddCardScreen2State extends State<AddCardScreen2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController validityController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  DateTime? validFrom;
  DateTime? validUntil;
  int selectedOption = 1;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    bankController = TextEditingController();
    accountController = TextEditingController();
    cardController = TextEditingController();
    validityController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    bankController.dispose();
    accountController.dispose();
    cardController.dispose();
    validityController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          startDateController.text =
              '${picked.day}/${picked.month}/${picked.year}';
          validFrom = picked;
        } else {
          endDateController.text =
              '${picked.day}/${picked.month}/${picked.year}';
          validUntil = picked;
        }
      });
      // print(startDateController);
      // print('****************8');
      // print(endDateController);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
            size: 25,
          ),
          title: const Text(
            'Add Card Details',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
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
                      controller: nameController,
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
                    child: DropdownButtonFormField<String>(
                      value: bankController.text.isEmpty
                          ? null
                          : bankController.text,
                      onChanged: (String? newValue) {
                        setState(() {
                          bankController.text = newValue!;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.account_balance, size: 24),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Select Bank Name',
                      ),
                      items: <String>[
                        'Bank Al Habib',
                        'MCB',
                        'Meezan Bank',
                        'Sadapay',
                        'HBL'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
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
                    child: TextFormField(
                      controller: accountController,
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
                      validator: (value) {
                        if (value == null || value.length < 12) {
                          return 'Account number must be at least 12 digits';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(35, 5, 0, 0),
                        child: Text(
                          'CVC',
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
                    child: TextFormField(
                      controller: cvcController,
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
                        hintText: 'Enter CVC No',
                      ),
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      validator: (value) {
                        if (value == null || value.length < 3) {
                          return 'CVC must be at least 3 digits';
                        }
                        return null;
                      },
                    ),
                  ),
                  //CARD
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(35, 5, 0, 0),
                        child: Text(
                          'Card No',
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
                    child: TextFormField(
                      controller: cardController,
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
                        hintText: 'Enter Card No',
                      ),
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      validator: (value) {
                        if (value == null || value.length < 16) {
                          return 'Card number must be at least 16 digits';
                        }
                        return null;
                      },
                    ),
                  ),

                  //validity start and end
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(35, 5, 0, 0),
                        child: Text(
                          'Validity',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'start date',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'End date',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    child: Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 3, // Adjust the flex factor to resize
                          child: TextFormField(
                            controller: startDateController,
                            readOnly: true,
                            onTap: () => _selectDate(context, true),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.date_range, size: 24),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Valid From',
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3, // Adjust the flex factor to resize
                          child: TextFormField(
                            controller: endDateController,
                            readOnly: true,
                            onTap: () => _selectDate(context, false),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.date_range, size: 24),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Valid Until',
                            ),
                          ),
                        ),
                      ],
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
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowCardScreen(
                              name: nameController.text,
                              status:
                                  selectedOption == 1 ? 'Active' : 'Inactive',
                              bank: bankController.text,
                              account: accountController.text,
                              card: cardController.text,
                              cvc: cvcController.text,
                              startDate: startDateController.text,
                              endDate: endDateController.text,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
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
        ),
      ),
    );
  }
}
