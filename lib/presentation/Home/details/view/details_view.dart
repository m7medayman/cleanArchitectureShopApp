import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_shop/model/models.dart';
import 'package:mvvm_shop/presentation/Home/details/cubit/details_cubit.dart';
import 'package:mvvm_shop/presentation/common/text_widget.dart';
import 'package:mvvm_shop/presentation/resources/color_manager.dart';
import 'package:mvvm_shop/presentation/resources/strings_manager.dart';
import 'package:mvvm_shop/presentation/resources/styles_manager.dart';
import 'package:mvvm_shop/presentation/resources/values_manager.dart';

class DetailsView extends StatefulWidget {
  String id;
  DetailsView({
    super.key,
    required this.id,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: myText(
          AppStrings.details,
        ),
      ),
      body: BlocProvider(
        create: (context) => DetailsCubit(widget.id),
        child: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            print(state);
            if (state is DetailsFetchSuccess) {
              print(state.data.imageUrl);
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(AppSize.s8),
                        child: Image(image: NetworkImage(state.data.imageUrl)),
                      ),
                      _article(AppStrings.details, state.data.details),
                      _article(AppStrings.about, state.data.aboutStore),
                      _article(AppStrings.services, state.data.services)
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Padding _article(String header, String data) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myText(
            header,
            style: getBoldStyle().copyWith(color: ColorManager.primary),
          ),
          myText(
            data,
            style: getRegularStyle(),
          ),
        ],
      ),
    );
  }
}
