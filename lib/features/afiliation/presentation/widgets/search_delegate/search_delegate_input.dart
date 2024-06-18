import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';

class SearchDelegateInput extends StatelessWidget {
  const SearchDelegateInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 300
      ),
      child: const CustomTextInput(
        hintText: 'Buscar',
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}