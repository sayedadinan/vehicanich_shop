import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/Interior_service_updation/bloc/interior_service_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/body_service_updation/bloc/body_service_updation_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/engine_service_updation/bloc/engine_service_bloc.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/app_validators.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

void showAddMoreDialog(
  BuildContext context,
  Bloc bloc,
  String eventType,
) {
  final TextEditingController serviceNameController = TextEditingController();
  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Form(
          key: signupKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
              Text(
                'Add all your services',
                style: TextStyle(
                    fontSize: Mymediaquery().mediaqueryheight(0.02, context)),
              ),
              SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
              Inputfield(
                validator: (value) =>
                    Validators().validateEmpty('service', value),
                controller: serviceNameController,
                hinttext: 'Give your services',
                keyboardType: TextInputType.name,
                label: 'service',
              ),
              SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (signupKey.currentState!.validate()) {
                        String serviceName = serviceNameController.text;
                        switch (eventType) {
                          case 'interior':
                            bloc.add(
                              InteriorServiceUpdationAddingPressed(
                                serviceName: serviceName,
                              ),
                            );
                            break;
                          case 'engine':
                            bloc.add(
                              EngineServiceUpdationAddingPressed(
                                serviceName: serviceName,
                              ),
                            );
                            break;
                          case 'body updation':
                            bloc.add(BodyServiceUpdationAddingPressed(
                              serviceName: serviceName,
                            ));
                        }
                        serviceNameController.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
