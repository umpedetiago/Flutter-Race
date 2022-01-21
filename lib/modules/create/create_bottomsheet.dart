import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:meuapp/shared/widgets/button/button.dart';
import 'package:meuapp/shared/widgets/input_text/input_text.dart';

class CreateBottomsheet extends StatelessWidget {
  const CreateBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              InputText(label: "Produto", hint: "Digite um nome"),
              SizedBox(
                height: 8,
              ),
              InputText(
                label: "Preço",
                hint: "Digite o valor",
                keybordType: TextInputType.number,
                inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
              ),
              SizedBox(
                height: 8,
              ),
              InputText(
                keybordType: TextInputType.datetime,
                label: "Data da compra",
                inputFormatters: [MaskedInputFormatter('00/00/00')],
                hint: "Digite dd/mm/aa",
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                label: "Adicionar",
                onTap: () {},
                type: ButtonType.fill,
              )
            ],
          ),
        ),
      ),
    );
  }
}
