import 'package:flutter/material.dart';
import 'package:appflutter/util/user_service.dart';
import 'package:appflutter/model/user_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> listUser = <UserModel>[];

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  void getDataUser() async {
    List<UserModel> listUserTemp = await UserService.fetchUser();
    if (listUserTemp.isNotEmpty) {
      setState(() {
        listUser = listUserTemp;
      });
    }
  }

  void showUserDetail(UserModel user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: const Text(
            'User Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.network(
                  user.avatar ?? '-',
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                user.email ?? '-',
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: listUser.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          itemBuilder: (context, index) {
            final user = listUser[index];
            return ListTile(
              leading: ClipOval(
                child: Image.network(
                  user.avatar ?? '-',
                  width: 52.0,
                  height: 52.0,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                user.email ?? '-',
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
              onTap: () => showUserDetail(user), // Tambahkan onTap
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
