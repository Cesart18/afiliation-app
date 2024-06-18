import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';

class SearchDelegateInput extends StatelessWidget {
  const SearchDelegateInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      height: 50,
      child:  CustomTextInput(
        hintText: 'Buscar',
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}