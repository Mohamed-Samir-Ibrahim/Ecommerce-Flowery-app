import 'package:flowery/core/utils/resources/string_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/resources/custom_elevated_button.dart';
import '../../../../../core/utils/resources/main_text_field.dart';
import '../../../../../di/injetible_intinalizer.dart';
import '../profile_states.dart';
import '../profile_view_model.dart';
import 'map.dart';

class AddressScreen extends StatefulWidget {
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String? selectedArea;

  ProfileViewModel profileViewModel = getIt<ProfileViewModel>();

  @override


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(StringManager.Address, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (_) => getIt<ProfileViewModel>()
          ..dointent(GetCitiesIntent()),
        child: BlocBuilder<ProfileViewModel, ProfileState>(
          builder: (context, state) {
            if (state.status == ProfileStates.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.status == ProfileStates.error) {
              return Center(child: Text(state.message ?? StringManager.Erroroccurred));
            } else if (state.status == ProfileStates.success) {
              final cities = state.citiesentity ?? [];
              final states = state.stateentity ?? [];
              final areas = states.where((s) => s.governorate_id.toString() ==profileViewModel.selectedCity.toString()).toList();
              return Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        child: map(
                          onAddressPicked: (String address) {
                            profileViewModel.street.text = address;
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(height: 12.h),
                      CustomTextFormField(
                        controller: profileViewModel.street,
                        labelText: StringManager.Address,
                        hintText: StringManager.EnterYourAddress,
                      ),
                      SizedBox(height: 12.h),
                      CustomTextFormField(
                        controller: profileViewModel.phone,
                        labelText: StringManager.phoneNumber,
                        hintText: StringManager.enterYourPhoneNumber,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 12.h),
                      CustomTextFormField(
                        controller: profileViewModel.username,
                        labelText: StringManager.Recipie_ntname,
                        hintText: StringManager.Enter_the_recipient_name,
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: profileViewModel.selectedCity,
                              decoration: InputDecoration(
                                labelText: StringManager.city,
                                border: OutlineInputBorder(),
                              ),
                              items: cities.map((city) {
                                return DropdownMenuItem(
                                  value: city.id.toString(),
                                  child: Text(city.nameEn),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedArea = null;
                                  profileViewModel.selectedCity = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: DropdownButtonFormField<String>(
                                value: selectedArea,
                                decoration: InputDecoration(
                                  labelText:StringManager.Area,
                                  border: OutlineInputBorder(),
                                ),
                                items: areas.map((area) {
                                  return DropdownMenuItem(
                                    value: area.city_name_en,
                                    child: Text(area.city_name_en),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedArea = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      CustomElevatedButton(
                        label: StringManager.save,
                        onPressed: () async {
                          await profileViewModel..dointent(SaveAddressIntent());
                          print("Address: ${profileViewModel.street.text}");
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text(StringManager.Erroroccurred));
            }
          },
        ),
      ),
    );
  }
}
