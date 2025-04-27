import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_view_model.dart';
import '../../../../core/utils/resources/string_manager.dart';
import '../../../../core/utils/routes/routes_names.dart';
import '../../../../di/injetible_intinalizer.dart';
import 'edit_profile_screen.dart'; // تأكد تضيف الاستيراد ده

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileViewModel profileViewModel = getIt<ProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileState>(
      bloc: profileViewModel..doIntent(GetLoggedUserIntent()), // أول ما تفتح الشاشة يجيب بيانات اليوزر
      builder: (context, state) {
        if (state.status == ProfileStates.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state.status == ProfileStates.error) {
          return Scaffold(
            body: Center(child: Text('Error: ${state.message}')),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: _buildAppBar(context),
            body: Column(
              children: [
                _buildHeader(context, state),
                const SizedBox(height: 20),
                _buildOptions(context),
                const Spacer(),
                _buildLogout(context),
              ],
            ),
          );
        }
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Text(
            StringManager.appName.tr(),
            style: TextStyle(
              color: Colors.pink.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ProfileState state) {
    final user = state.getLoggedUserDataEntity?.user;

    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: user?.photo != null
              ? NetworkImage(user!.photo??'')
              : const NetworkImage('https://via.placeholder.com/150'),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user?.firstName ?? 'User',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EditProfileScreen()),
                );
              },
              child: const Icon(Icons.edit, size: 16),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          user?.email ?? 'Email',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Column(
      children: [
        _buildTile(Icons.shopping_bag_outlined, StringManager.myOrders, onTap: () {}),
        _buildTile(Icons.location_on_outlined, StringManager.savedAddress, onTap: () {}),
        _buildNotificationSwitch(),
        _buildLanguageOption(),
        _buildTile(Icons.info_outline, StringManager.aboutUs, onTap: () {}),
        _buildTile(Icons.description_outlined, StringManager.termsConditions, onTap: () {}),
      ],
    );
  }

  Widget _buildTile(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildNotificationSwitch() {
    bool isNotificationOn = true;
    return ListTile(
      leading: const Icon(Icons.notifications_none, color: Colors.black),
      title: Text(StringManager.notification),
      trailing: Switch(
        activeColor: Colors.pink.shade400,
        value: isNotificationOn,
        onChanged: (value) {
          // تقدر تتحكم فيه بعدين
        },
      ),
    );
  }

  Widget _buildLanguageOption() {
    return ListTile(
      leading: const Icon(Icons.language, color: Colors.black),
      title: Text(StringManager.language),
      trailing: Text(
        StringManager.english,
        style: const TextStyle(color: Colors.grey),
      ),
      onTap: () {
        // تفتح اختيار اللغة هنا
      },
    );
  }

  Widget _buildLogout(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.black),
          title: Text(StringManager.logout),
          onTap: () {
            profileViewModel.doIntent(LogOutIntent());
            Navigator.pushNamedAndRemoveUntil(context, RoutesNames.loginScreen, (route) => false);
          },
        ),
        const SizedBox(height: 10),
        Text(
          StringManager.version,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
