import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qoute_train/config/locale/app_localizations.dart';
import 'package:qoute_train/core/utils/app_colors.dart';
import 'package:qoute_train/core/widgets/error_widget.dart';
import 'package:qoute_train/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:qoute_train/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:qoute_train/features/random_quote/presentation/widgets/quote_refresh.dart';
import 'package:qoute_train/features/splach_screen/presentation/cubit/locale_cubit.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteLoading) {
          return Center(
            child: SpinKitDoubleBounce(
              color: AppColors.primary,
            ),
          );
        } else if (state is RandomQuoteError) {
          return ErrorScreen(
            onPress: () => _getRandomQuote(),
          );
        } else if (state is RandomQuoteLoaded) {
          return Column(
            children: [
              QuoteContent(
                quote: state.quote,
              ),
              InkWell(
                onTap: () => _getRandomQuote(),
                child: const QuoteRefresh(),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('no'),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //* AppBar
    final appBar = AppBar(
       backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.translate_outlined,
          color: AppColors.primary,
        ),
        onPressed: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            BlocProvider.of<LocaleCubit>(context).toArabic();
          } else {
            BlocProvider.of<LocaleCubit>(context).toEnglish();
          }
        },
      ),
      title: Text(AppLocalizations.of(context)!.translate('app_name')!),
    );

    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: appBar,
        body: _buildContent(),
      ),
    );
  }
}
