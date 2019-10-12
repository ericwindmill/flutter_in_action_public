/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce/blocs/app_state.dart';
import 'package:e_commerce/blocs/user_bloc.dart';
import 'package:e_commerce/models/events/add_product.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/widget/forms/form_field_container.dart';
import 'package:flutter/material.dart';

class UserProfileForm extends StatefulWidget {
  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  UserBloc _bloc;
  bool _userInformationHasBeenUpdated = false;
  String _prevName;
  String _prevContact;

  @override
  void didChangeDependencies() async {
    _bloc = AppStateContainer.of(context).blocProvider.userBloc;
    var user = await _bloc.user.first.then((u) => u);
    _nameController = TextEditingController(text: user.name);
    _emailController = TextEditingController(text: user.contact);

    _prevName = _nameController.text;
    _prevContact = _emailController.text;

    _nameController.addListener(onChangeName);
    _emailController.addListener(onChangeEmail);
    super.didChangeDependencies();
  }

  void onChangeName() {
    if (_prevName == _nameController.text && _prevContact == _emailController.text) return;
    setState(() {
      _userInformationHasBeenUpdated = true;
    });
  }

  void onChangeEmail() {
    if (_prevName == _nameController.text && _prevContact == _emailController.text) return;
    setState(() {
      _userInformationHasBeenUpdated = true;
    });
  }

  FlatButton get submitButton => FlatButton(
        onPressed: _userInformationHasBeenUpdated
            ? () {
                _bloc.updateUserInformationSink.add(
                  UpdateUserEvent(
                    ECommerceUser(name: _nameController.text, contact: _emailController.text),
                  ),
                );
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                            "Submitted Name: ${_nameController.text}, Submitted Contact: ${_emailController.text}"),
                      );
                    });
              }
            : null,
        child: Text("Submit info"),
      );

  @override
  Widget build(BuildContext context) {
    Widget avatar = Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/apple-in-hand.jpg"),
          radius: 60.0,
        ));

    return Column(
      children: <Widget>[
        avatar,
        FormFieldContainer(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name:",
            ),
            controller: _nameController,
          ),
        ),
        FormFieldContainer(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Contact:",
            ),
            controller: _emailController,
          ),
        ),
        submitButton,
      ],
    );
  }
}
