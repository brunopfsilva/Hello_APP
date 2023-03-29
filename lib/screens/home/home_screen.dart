import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hello_app/Common/routes.dart';
import 'package:hello_app/screens/home/widgets/home_button.dart';
import 'package:hello_app/screens/login/login_screen.dart';
import 'package:hello_app/core/custom_icons.dart';

import '../utilities/alert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _exitTime;

  Future<bool> _exitCheck() async {
    final DateTime now = DateTime.now();
    if (_exitTime == null ||
        now.difference(_exitTime!) > const Duration(seconds: 2)) {
      _exitTime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          'Pressione novamente para sair',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.grey[800]!,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final List<HomeButton> _buttons = [
      HomeButton(
        customIcon: CustomIcons.contrachequeCircular,
        labelText: 'Contracheque',
        onPressed: () => Navigator.pushNamed(context, '/paycheck'),
      ),
      HomeButton(
        customIcon: CustomIcons.pontoCircular,
        labelText: 'Ponto',
        //onPressed: () => Navigator.pushNamed(context, '/checkIn'),
        onPressed: () =>
            alert(context, "Funcionalida disponivel em breve", "Home"),
      ),
      HomeButton(
        customIcon: CustomIcons.beneficiosCircular,
        labelText: 'Benefícios',
        //onPressed: () => Navigator.pushNamed(context, '/benefits'),
        onPressed: () =>
            alert(context, "Funcionalida disponivel em breve", "Home"),
      ),
      HomeButton(
        customIcon: CustomIcons.muralCircular,
        labelText: 'Mural',
        //onPressed: () => Navigator.pushNamed(context, '/mural'),
        onPressed: () =>
            alert(context, "Funcionalida disponivel em breve", "Home"),
      ),
      HomeButton(
        customIcon: CustomIcons.feriasCircular,
        labelText: 'Férias',
        //onPressed: () => Navigator.pushNamed(context, '/vacation'),
        onPressed: () =>
            alert(context, "Funcionalida disponivel em breve", "Home"),
      ),
      HomeButton(
        customIcon: CustomIcons.comprovantesCircular,
        labelText: 'Recibos',
        //onPressed: () => Navigator.pushNamed(context, '/receipts'),
        onPressed: () =>
            alert(context, "Funcionalida disponivel em breve", "Home"),
      ),
      HomeButton(
        customIcon: CustomIcons.treinamentoCircular,
        labelText: 'Treinamentos',
        //onPressed: () => Navigator.pushNamed(context, '/trainings'),
        onPressed: () =>
            alert(context, "Funcionalida disponivel em breve", "Home"),
      ),
      HomeButton(
        customIcon: CustomIcons.avaliacaoDesempenhoCircular,
        labelText: 'Avaliação de Desempenho',
        //onPressed: () => Navigator.pushNamed(context, '/trainings'),
        onPressed: () =>
            alert(context, "Funcionalida disponivel em breve", "Home"),
      ),
      HomeButton(
        customIcon: CustomIcons.formularioCircular,
        labelText: 'Formulários',
        //onPressed: () => Navigator.pushNamed(context, '/trainings'),
        onPressed: () =>
            alert(context, "Funcionalida disponivel em breve", "Home"),
      ),
      HomeButton(
        customIcon: CustomIcons.pesquisaCliemaCircular,
        labelText: 'Pesquisa Organizacional',
        //onPressed: () => Navigator.pushNamed(context, '/trainings'),
        onPressed: () =>
            alert(context, "Funcionalida disponivel em breve", "Home"),
      ),
      HomeButton(
        customIcon: CustomIcons.configuracoesCircular,
        labelText: 'Configurações',
        //onPressed: () => Navigator.pushNamed(context, '/config'),
        onPressed: () =>
            alert(context, "Funcionalida disponivel em breve", "Home"),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: _exitCheck,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(45.0),
                            child: const Image(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hello,',
                                style: TextStyle(
                                  fontFamily: 'Dekko',
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: ' ${globalUser.userName.split(' ')[0]}!',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: Text('SAIR'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AnimationLimiter(
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.4,
                    physics: const ClampingScrollPhysics(),
                    children: _buttons
                        .map((element) => AnimationConfiguration.staggeredGrid(
                              position: _buttons.indexOf(element),
                              columnCount: 2,
                              duration: const Duration(milliseconds: 275),
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: element,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
