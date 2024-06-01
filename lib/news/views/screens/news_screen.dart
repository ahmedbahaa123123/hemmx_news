import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/cubit/news_cubit.dart';
import '../../data/cubit/news_state.dart';
import '../widgets/list_item_widget.dart';


class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => NewsCubit()..getNews(),
        child: BlocBuilder<NewsCubit, NewsStates>(
          builder: (context, state) {
            return SafeArea(
              child: (state is NewsLoading) ?
              const Center(child: CircularProgressIndicator()) :
              (state is NewsSuccess) ?
              ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return ListItemWidget(
                    model: NewsCubit.get(context).newsList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: NewsCubit.get(context).newsList.length,
              )
                  : const Center(child: Text('Error')),
            );
          },
        ),
      ),
    );
  }
}
