import 'package:date_time_picker/date_time_picker.dart';
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

  void onPressed(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(top: 14.7),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        dismissDirection: DismissDirection.down,
        content: Text(
          'Sended!',
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );
    FocusScope.of(context).requestFocus(FocusNode());
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
                    if (value == '') {
                      return "Name must be completed.";
                    }
                    return null;
                  },
                ),
                DateTimePicker(
                  cursorColor: color.onPrimary,
                  style: text.bodyLarge!.copyWith(color: color.onPrimary),
                  initialValue: '',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Date',
                  validator: (value) {
                    if (value == '') {
                      return "Date must be completed.";
                    }
                    return null;
                  },
                  onSaved: (val) => print(val),
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
                    if (value == '') {
                      return "Telephone must be completed.";
                    }
                    return null;
                  },
                ),
                WFButton.white(
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
