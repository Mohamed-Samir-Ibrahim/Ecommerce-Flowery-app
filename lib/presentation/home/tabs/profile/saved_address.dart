import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_states.dart';
import 'package:flowery/presentation/home/tabs/profile/profileviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedAddressesScreen extends StatefulWidget {
  SavedAddressesScreen({Key? key}) : super(key: key);

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<Profileviewmodel>().getsavedaddress(); // Add your BLoC method for fetching addresses
  }

  @override
  Widget build(BuildContext context) {
      final profile = getIt.get<Profileviewmodel>();
      
    return BlocProvider.value(
      // create: (BuildContext context) 
      // { 
      //   return profile;
      // },
      value: profile,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Saved address'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      
        body: BlocConsumer<Profileviewmodel, ProfileStates>(
          listener: (context, state) {
            if (state.status == ProfileStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Failed to load addresses")),
              );
            }
          },
          builder: (context, state) {
            if (state.status == ProfileStatus.loading) {
              return Center(child: CircularProgressIndicator());
            }
      
            if (state.obj_SavedAddress_Response_entity == null || state.obj_SavedAddress_Response_entity!.isEmpty) {
              return Center(child: Text("No saved addresses found"));
            }
      
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.obj_SavedAddress_Response_entity!.length, // Dynamically use the address list
                      itemBuilder: (context, index) {
                        final address = state.obj_SavedAddress_Response_entity![index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const Icon(Icons.location_on, color: Colors.black),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "address.city ?? 'No city',",
                                        style: const TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "address.details ?? 'No details',",
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.grey),
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        // Add new address logic
                      },
                      child: const Text(
                        'Add new address',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
