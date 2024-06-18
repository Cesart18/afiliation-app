import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../presentation.dart';

class NewAfiliationWidget extends StatelessWidget {
  const NewAfiliationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      height: double.infinity,

      constraints: const BoxConstraints(
        maxWidth: 900,
        maxHeight: 70
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),

      child:  Row(
        children: [
          const CustomTextInput(
            flex: 2,
            labelText: 'Nombre',
            hintText: 'Luis',
          ),
          const SizedBox(width: 10,),
          const CustomTextInput(
            flex: 2,
            labelText: 'Apellido',
            hintText: 'Moreno',
          ),
          const SizedBox(width: 10,),
          CustomTextInput(
            flex: 1,
            labelText: 'Monto facturado',
            hintText: '10.00',
            textAlign: TextAlign.end,
            // keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
            ],
          ),
          const SizedBox(width: 20,),
          const PrimaryButton(
            text: 'Aceptar',
          ),
        ],
      ),
    );
  }
}


