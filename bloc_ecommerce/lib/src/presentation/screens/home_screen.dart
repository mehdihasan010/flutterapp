import 'package:bloc_ecommerce/src/data/preference/local_preference.dart';
import 'package:bloc_ecommerce/src/routes/route_pages.dart';
import 'package:bloc_ecommerce/src/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/blocs.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocListener<LogoutBloc, LogoutState>(
            listener: (context, state) {
              if (state is LogOutSuccess) {
                context.goNamed(Routes.WELCOME_ROUTE);
              }
              if (state is LogOutFailed) {
                Fluttertoast.showToast(msg: state.massage);
              }
            },
            child: IconButton(
                onPressed: () =>
                    context.read<LogoutBloc>().add(RequestSignOut()),
                icon: const Icon(Icons.logout_rounded),
                color: theme.colorScheme.primary),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: [
            ListTile(
                title: Text(
                    '${Values.GREETINGS} ${LocalPreferences.getString('username')}'),
                titleTextStyle: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                subtitle: const Text(Values.WELCOME_SUB_TITLE),
                subtitleTextStyle: theme.textTheme.labelMedium),
            const CustomSearchBar(),
            const Gap(20),
            SizedBox(
              height: layout.width * 0.13,
              child: BlocBuilder<BrandBloc, BrandState>(
                builder: (context, state) {
                  if (state is BrandFetchSuccess) {
                    return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => BrandCard(
                              brandTitle: state.brands[index].brandName,
                              brandLogo: state.brands[index].brandLogo,
                            ),
                        separatorBuilder: (context, index) => const Gap(8.0),
                        itemCount: state.brands.length);
                  } else {
                    return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            ShimmerEffect.rectangular(
                                width: layout.width * 0.13, height: 80),
                        separatorBuilder: (context, index) => const Gap(8.0),
                        itemCount: 10);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
