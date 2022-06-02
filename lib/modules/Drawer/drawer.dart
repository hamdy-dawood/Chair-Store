import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../animation/animation.dart';
import '../../auth/auth_page.dart';

class MainDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    const name = 'Your Email';
    return Drawer(
      child: Material(
        color: Color(0xFFF5EFF1),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Container(
                        height: 30.0,
                        width: 30.0,
                        child: Image.asset(
                          "images/icons/left.png",
                          color: Color(0xFFFC6B68),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Back".toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFFFC6B68),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildHeader(name: name, email: user.email!, onClicked: () {}
                // => Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => UserPage(
                //     name: 'Sarah Abs',
                //     urlImage: urlImage,
                //   ),
                // )),
                ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  FadeAnimation(
                      delay: 1.5,child: buildSearchField()),
                  const SizedBox(height: 24),
                  FadeAnimation(delay: 2,
                    child: buildMenuItem(
                        text: 'Favourites',
                        icon: Icons.favorite_border,
                        onClicked: () {}),
                  ),
                  const SizedBox(height: 16),
                  FadeAnimation(
                    delay: 2.5,
                    child: buildMenuItem(
                        text: 'Workflow',
                        icon: Icons.workspaces_outline,
                        onClicked: () {}),
                  ),
                  const SizedBox(height: 16),
                  FadeAnimation(
                    delay: 3,
                    child: buildMenuItem(
                        text: 'Updates', icon: Icons.update, onClicked: () {}),
                  ),
                  const SizedBox(height: 24),
                  FadeAnimation(
                      delay: 3.5,child: Divider(color: Colors.grey[700])),
                  const SizedBox(height: 24),
                  FadeAnimation(
                    delay: 3.5,
                    child: buildMenuItem(
                        text: 'Notifications',
                        icon: Icons.notifications_outlined,
                        onClicked: () {}),
                  ),
                  const SizedBox(height: 16),
                  FadeAnimation(
                    delay: 4,
                    child: buildMenuItem(
                      text: 'Log out',
                      icon: Icons.logout,
                        onClicked: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AuthPage(),
                              ));
                        }
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      FadeAnimation(
        delay: 1,
        child: InkWell(
          onTap: onClicked,
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 20)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(
                    FontAwesomeIcons.user,
                    color: Color(0xFFFC6B68),
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFFFC6B68),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700],
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.grey[700];

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(
          Icons.search,
          color: Color(0xFFFC6B68),
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xFFFC6B68),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xFFFC6B68),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xFFFC6B68),
        size: 30,
      ),
      title: Text(text, style: TextStyle(color: color, fontSize: 17.0)),
      onTap: onClicked,
    );
  }
}
