import 'package:ecommerce/views/wigets/main_bottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);


  Future<void> _logout(AuthController model, context) async {
    try {
      await model.logout();
      Navigator.pop(context);
    } catch (e) {
      debugPrint('logout error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return
      Consumer<AuthController>(
        builder: (_, model, __) =>
            Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                  child: MainBottom(text: 'Log Out', onTap: (){
                    _logout(model, context);
                  },hasBorder: true,),
                )
              ],
            ),
      );

  }

}