import 'package:flutter/material.dart';
import 'package:hello_app/screens/login/widgets/login_card.dart';
// import 'package:video_player/video_player.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // late final VideoPlayerController _videoCtrl;

  // @override
  // void initState() {
  //   _videoCtrl = VideoPlayerController.asset('assets/videos/background.mp4')
  //     ..initialize().then((_) {
  //       _videoCtrl.play();
  //       _videoCtrl.setLooping(true);
  //       setState(() {});
  //     });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _videoCtrl.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height - padding.bottom - padding.top,
            child: Center(
              child: AspectRatio(
                aspectRatio: 0.561,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Image(
                      image: AssetImage('assets/images/app_logo_login.png'),
                      height: 100,
                    ),
                    SizedBox(height: 40.0),
                    LoginCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
