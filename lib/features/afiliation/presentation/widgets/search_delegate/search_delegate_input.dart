import 'package:afiliados_app/features/afiliation/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchDelegateInput extends ConsumerWidget {
  const SearchDelegateInput({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return  SizedBox(
      width: 300,
      height: 50,
      child:  CustomTextInput(
        hintText: 'Buscar',
        suffixIcon: const Icon(Icons.search),
        onChanged: ref.read(searchDelegateProvider.notifier).onInputChanged,
      ),
    );
  }
}