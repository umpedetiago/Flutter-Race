import 'package:flutter/material.dart';
import 'package:meuapp/modules/pages/login/create_account/create-account-controller.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/button/button.dart';
import 'package:meuapp/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final controller = CreateAccountContrller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        leading: BackButton(
          color: AppTheme.colors.backButton,
        ),
        elevation: 0,
      ),
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Criando uma conta",
                  style: AppTheme.textStyles.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Mantenha seus gastos em dia",
                  style: AppTheme.textStyles.subititle,
                ),
                SizedBox(
                  height: 38,
                ),
                InPutText(
                  label: 'Nome',
                  hint: 'Digite seu nome completo',
                  onChanged: (value) => controller.onChange(name: value),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Digite seu nome completo",
                ),
                SizedBox(
                  height: 18,
                ),
                InPutText(
                  label: 'E-mail',
                  hint: 'Digite seu email',
                  onChanged: (value) => controller.onChange(email: value),
                  validator: (value) =>
                      isEmail(value!) ? null : 'digite um e-mail valido',
                ),
                SizedBox(
                  height: 18,
                ),
                InPutText(
                  obscure: true,
                  label: 'Senha',
                  hint: 'Digite sua senha',
                  onChanged: (value) => controller.onChange(password: value),
                  validator: (value) =>
                      value!.length >= 6 ? null : "digite uma senha valida",
                ),
                SizedBox(
                  height: 14,
                ),
                Button(
                  label: 'Criar conta',
                  type: ButtonType.fill,
                  onTap: () {
                    controller.create();
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
