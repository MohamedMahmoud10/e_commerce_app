import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/search_cubit/search_states.dart';

import '../../../cubit/search_cubit/search_cubit.dart';
import '../../widgets/email_form_field.dart';
import 'components/search_build_item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: (Column(
                  children: [
                    EmailFormField(
                      hitText: 'Search',
                      label: 'Search SomeThing',
                      prefixIcon: const Icon(Icons.search),
                      emailController: searchController,
                      onChanged: (String value) {},
                      validator: (String? value) {
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (String value) {
                        cubit.searchAllProduct(text: value);
                      },
                    ),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 30,
                    ),
                    if (state is SearchSuccessState)
                      ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.searchModel.data?.data.length ?? 10,
                        itemBuilder: (context, index) => SearchProductsView(
                            data: cubit.searchModel.data!.data[index]),
                      )
                  ],
                )),
              ),
            ),
          ),
        );
      },
    );
  }
}
