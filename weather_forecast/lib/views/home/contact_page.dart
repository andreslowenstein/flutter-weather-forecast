import 'package:flutter/material.dart';
import 'package:weather_forecast/widgets/wf_button.dart';
import 'package:weather_forecast/widgets/wf_textfield.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _telController = new TextEditingController();

  void onPressed(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.primary,
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WFTextFormField.text(
                  placeHolder: 'Name',
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: color.onPrimary,
                  ),
                  validator: (value) {
                    if (_nameController.text == '') {
                      return "Name must be completed.";
                    }
                  },
                ),
                WFTextFormField.text(
                  placeHolder: 'Birth Date',
                  prefixIcon: Icon(
                    Icons.calendar_month_outlined,
                    color: color.onPrimary,
                  ),
                  validator: (value) {
                    if (_nameController.text == '') {
                      return "Name must be completed.";
                    }
                  },
                ),
                WFTextFormField.text(
                  placeHolder: 'Email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: color.onPrimary,
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Email must be completed.';
                    }

                    RegExp exp = new RegExp(
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

                    var res = exp.hasMatch(value.trim());
                    if (!res) return "Invalid email";

                    return null;
                  },
                ),
                WFTextFormField.number(
                  placeHolder: 'Telephone',
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: color.onPrimary,
                  ),
                  validator: (value) {
                    if (_nameController.text == '') {
                      return "Telephone must be completed.";
                    }
                  },
                ),
                WFButton.accent(
                  label: 'Send',
                  onPressed: (context) => {
                    onPressed(context),
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
