import 'package:flutter/material.dart';
import 'package:meuapp/modules/pages/login/login_controller.dart';
import 'package:meuapp/shared/widgets/button/button.dart';
import 'package:meuapp/shared/widgets/input_text/input_text.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginContrller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 223,
                ),
                InPutText(
                  label: 'E-mail',
                  hint: 'Digite seu email',
                  onChanged: print,
                  validator: (value) =>
                      isEmail(value!) ? null : 'digite um e-mail valido',
                ),
                SizedBox(
                  height: 18,
                ),
                InPutText(
                  label: 'Senha',
                  hint: 'Digite sua senha',
                  obscure: true,
                  onChanged: print,
                  validator: (value) =>
                      value!.length >= 6 ? null : "digite uma senha valida",
                ),
                SizedBox(
                  height: 14,
                ),
                Button(
                  label: 'Entrar',
                  type: ButtonType.fill,
                  onTap: () {
                    controller.login();
                  },
                ),
                SizedBox(height: 50),
                Button(
                  label: 'Criar Conta',
                  type: ButtonType.outline,
                  onTap: () {
                    Navigator.pushNamed(context, "/login/create-account");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
