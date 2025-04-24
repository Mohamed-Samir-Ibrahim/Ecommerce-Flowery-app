  // ignore_for_file: non_constant_identifier_names

  import 'package:flowery/core/shared_Preferences.dart';
  import 'package:flowery/core/utils/resources/color_manager.dart';
  import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
  import 'package:flowery/core/utils/resources/string_manager.dart';
  import 'package:flowery/core/utils/resources/styles_manager.dart';
  import 'package:flowery/core/utils/resources/values_manager.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/auth/cubit/auth_view_model.dart';
  import 'package:flowery/presentation/auth/screens/login_screen.dart';
import 'package:flowery/presentation/home/tabs/profile/About_us_screen.dart';
import 'package:flowery/presentation/home/tabs/profile/saved_address.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'edit_profile_screen.dart';

  class ProfileScreen extends StatefulWidget {
    ProfileScreen({super.key,});

    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
  }

  class _ProfileScreenState extends State<ProfileScreen> {
    bool isLoggedIn = false;
    String? userName;
    String? email;
    final SecureStorageService Obj_secureStorageService = SecureStorageService(); 


    @override
    void initState() {
      super.initState();
      checkLoginStatus();
    }
    Future<void> checkLoginStatus() async {
      String? token = await Obj_secureStorageService.getToken();
        if (token != null && token.isNotEmpty)  {
        setState(() {
          isLoggedIn = true;
        });
      } else {
        setState(() {
          isLoggedIn = false;
        });
      }
    }
    @override
    Widget build(BuildContext context) {
     final authViewModel = getIt.get<AuthViewModel>();
    //final getuserdata = getIt.get<Profileviewmodel>();

    final SecureStorageService Obj_secureStorageService = SecureStorageService(); 

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Image.asset("assets/icon/flower.png"),
              SizedBox(width: 4.w),
              Text("Flowery", style: TextStyle(color: ColorManager.primary)),
              SizedBox(width: 17.w),
            ],
          ), 
          actions: isLoggedIn
              ? [
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none, color: Colors.black),
                        onPressed: () {},
                      ),
                      const Positioned(
                        right: 10,
                        top: 8,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(""),
                          radius: 8,
                          backgroundColor: Colors.red,
                          child: Text('3',
                              style: TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      )
                    ],
                  ),
                ]
              : null,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                   backgroundImage: AssetImage('assets/icon/icon.png'),
                   
                  ), 
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userName?? "Guest",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),  
                        const SizedBox(width: 5),
                        if (isLoggedIn)
                          IconButton(icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(),
                              ),
                            );
                          },
                          color: Colors.black, iconSize: 16,),
                      ],
                    ),
                  ),
                  Text(email?? "example@example.com", style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            if (isLoggedIn) ...[
              buildListTile(Icons.shopping_bag_outlined, StringManager.shopping_bag_outlined),
                 ListTile(
                leading: const Icon(Icons.location_on_outlined, color: Colors.black),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                title: const Text(StringManager.location_on_outlined),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SavedAddressesScreen(),
                    ),
                  );
                },
              ),
              const Divider(),
              SwitchListTile(
                value: true,
                onChanged: (val) {},
                title: const Text(StringManager.notification),
                activeColor: Colors.pink,
              ),
              const Divider(),
              buildListTile(Icons.language, StringManager.language,
                  trailing: const Text(StringManager.english, style: TextStyle(color: Colors.red))),
              ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.black),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                title: const Text(StringManager.info_outline),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Aboutus(),
                    ),
                  );
                },
              ),
              buildListTile(Icons.rule_folder_outlined, StringManager.rule_folder_outlined),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: const Text(StringManager.logout),
                onTap: logout,
                // ()async
                // { 
                //   //await authViewModel.doIntent(LogoutIntent());
                
                // } ,
              ),
            ] else ...[
              const SizedBox(height: 50),
              Center(
                child: CustomElevatedButton(
                  isStadiumBorder: false,
                  label: StringManager.login,
                  backgroundColor: ColorManager.primary,
                  textStyle: getBoldStyle(
                    color: ColorManager.white,
                    fontSize: SizeManager.s18,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 20),
            Center(
              child: Text(
                StringManager.versionApp,
                style: TextStyle(color: ColorManager.grey, fontSize: 12.sp),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    }

    Widget buildListTile(IconData icon, String title, {Widget? trailing}) {
      return ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      );
    }

    Future<void> logout() async {
      await Obj_secureStorageService.deleteToken();
      setState(() {
        isLoggedIn = false;
        userName;
        email ;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  LoginScreen()),
      );
    }
  }
