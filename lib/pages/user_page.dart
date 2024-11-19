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
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}