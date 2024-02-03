import 'package:ecommerce/models/shipping_address.dart';
import 'package:ecommerce/views/wigets/mainDialog.dart';
import 'package:ecommerce/views/wigets/main_bottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/database_controller.dart';
import '../../../utilites/constants.dart';

class AddShippingAddressPage extends StatefulWidget {
  const AddShippingAddressPage({super.key});

  @override
  State<AddShippingAddressPage> createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> saveAddress(Database database) async {
    try {
      if (_formKey.currentState!.validate()) {
        final address = ShippingAddress(id: documentIdFromLocalData(),
            fullName: _fullNameController.text.trim(),
            address: _addressController.text.trim(),
            city: _cityController.text.trim(),
            state: _stateController.text.trim(),
            country: _countryController.text.trim(),
            zipCode: _zipCodeController.text.trim());
        await database.saveAddress(address);
        if(!mounted) return;
        Navigator.pop(context);
      }
    } catch (e) {
      MainDialog(
          context: context,
          content: e.toString(),
          title: 'Error Authentication').showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adding Shpipping title",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                TextFormField(
                  controller: _fullNameController,
                  validator: (value) =>
                  value!.isNotEmpty ? null : "please enter your Name",
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: Text('Full Name'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _addressController,
                  validator: (value) =>
                  value!.isNotEmpty ? null : "please enter your Address",
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: Text('Address'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cityController,
                  validator: (value) =>
                  value!.isNotEmpty ? null : "please enter your city",
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: Text('City'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _stateController,
                  validator: (value) =>
                  value!.isNotEmpty ? null : "please enter your State",
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: Text('State'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _zipCodeController,
                  validator: (value) =>
                  value!.isNotEmpty ? null : "please enter your Zip Code",
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: Text('Zip Code'),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                MainBottom(
                  text: "Save Address",
                  onTap: () => saveAddress(database),
                  hasBorder: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
