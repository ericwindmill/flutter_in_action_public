/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:io';

import 'package:e_commerce/blocs/app_state.dart';
import 'package:e_commerce/blocs/catalog_bloc.dart';
import 'package:e_commerce/blocs/user_bloc.dart';
import 'package:e_commerce/models/events/add_product.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/widget/forms/form_field_container.dart';
import 'package:e_commerce/widget/forms/input_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  UserBloc _userBloc;
  CatalogBloc _bloc;
  @override
  void didChangeDependencies() {
    _bloc = AppStateContainer.of(context).blocProvider.catalogBloc;
    _userBloc = AppStateContainer.of(context).blocProvider.userBloc;
    super.didChangeDependencies();
  }

  NewProduct _newProduct = NewProduct();
  File _selected;

  ///
  /// End Widget Set Up Region
  /// ****************

  /// ****************
  /// Form Region Method
  ///

  bool _formChanged = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Spacing.matGridUnit()),
      child: Form(
        key: _formKey,
        onChanged: _onFormChange,
        onWillPop: _onWillPop,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _titleField,
              _costField,
              _dateAddedField,
              _categoryDropdownField,
              _imageField,
              Divider(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      textColor: Colors.red[400],
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.blue[400],
                      child: Text("Submit"),
                      onPressed: _submitForm,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ****************
  /// Form Widgets Region
  ///

  Widget get _titleField {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: FormFieldContainer(
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            helperText: "Required",
            labelText: "Title",
          ),
          autofocus: true,
          validator: (String val) {
            if (val.isEmpty) {
              return "Field cannot be left blank";
            }
            return null;
          },
          onSaved: (String val) => _newProduct.title = val,
        ),
      ),
    );
  }

  Widget get _costField {
    return FormFieldContainer(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Cost Per Unit",
          helperText: "Required",
        ),
        keyboardType: TextInputType.numberWithOptions(),
        autovalidate: true,
        validator: (String val) {
          if (val.isEmpty) {
            return "Field cannot be left blank";
          }
          if (double.tryParse(val) == null) {
            return "Field must contain a valid number.";
          }
          return null;
        },
        onSaved: (String val) => _newProduct.cost = double.tryParse(val),
      ),
    );
  }

  Widget get _categoryDropdownField {
    return FormFieldContainer(
      child: DropdownButtonFormField<ProductCategory>(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Category",
        ),
        value: _newProduct.category,
        onChanged: (ProductCategory newSelection) {
          setState(() => _newProduct.category = newSelection);
        },
        items: ProductCategory.values.map((ProductCategory category) {
          return DropdownMenuItem(value: category, child: Text(category.toString()));
        }).toList(),
      ),
    );
  }

  Widget get _dateAddedField {
    return FormFieldContainer(
      child: FormField(
        builder: (FormFieldState state) {
          return DateInputField(
            labelText: "Date Added",
            valueText: _newProduct.dateAdded != null ? formatDate(_newProduct.dateAdded) : null,
            onPressed: () async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  lastDate: DateTime.now().add(Duration(days: 365)));
              setState(() => _newProduct.dateAdded = date);
            },
          );
        },
        onSaved: (val) {},
        validator: (val) {
          return null;
        },
        initialValue: formatDate(DateTime.now()),
      ),
    );
  }

  Widget get _imageField {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 150.0,
          ),
          child: Container(
            decoration: _image,
          ),
        ),
        _selected == null ? Text("Select an image") : Container(),
        Positioned(
          right: 8.0,
          bottom: 8.0,
          child: FloatingActionButton(
            backgroundColor: AppColors.primary[500],
            foregroundColor: Colors.grey[300],
            child: Icon(Icons.photo_library),
            onPressed: () async {
              File image = await ImagePicker.pickImage(source: ImageSource.gallery);
              setState(() {
                _selected = image;
              });
            },
          ),
        ),
      ],
    );
  }

  BoxDecoration get _image {
    return _selected == null
        ? BoxDecoration(color: Colors.grey[300])
        : BoxDecoration(
            image: DecorationImage(image: FileImage(_selected), fit: BoxFit.cover),
          );
  }

  ///
  /// End Form Widgets Region
  /// ****************

  /// ****************
  /// Form Callbacks Region
  ///

  void _onFormChange() {
    setState(() {
      _formChanged = true;
    });
  }

  Future<bool> _onWillPop() {
    if (!_formChanged) return Future<bool>.value(true);
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
                content:
                    Text("Are you sure you want to abandon the form? Any changes will be lost."),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: () => Navigator.of(context).pop(false),
                    textColor: Colors.black,
                  ),
                  FlatButton(
                    child: Text("Abandon"),
                    textColor: Colors.red,
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ],
              ) ??
              false;
        });
  }

  void _submitForm() {
    _formKey.currentState.save();
    _bloc.addNewProduct.add(AddProductEvent(_newProduct));
    _userBloc.addNewProductToUserProductsSink.add(NewUserProductEvent(_newProduct));
    Navigator.of(context).pop();
  }

  ///
  /// End Form Methods Region
  /// ****************

  String formatDate(DateTime d) {
    var month = d.month;
    var day = d.day;
    var year = d.year;
    return "$month/$day/$year";
  }
}
