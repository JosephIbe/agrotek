import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/data/repositories/wallet_repository_impl.dart';
import 'package:agenpo/data/repositories/auth_repository_impl.dart';
import 'package:agenpo/data/repositories/geolocate_farm_repository_impl.dart';
import 'package:agenpo/data/repositories/inventory_repository_impl.dart';
import 'package:agenpo/data/repositories/offers_repository_impl.dart';
import 'package:agenpo/data/repositories/profile_repository_impl.dart';
import 'package:agenpo/data/repositories/transactions_repository_impl.dart';
import 'package:agenpo/data/repositories/kyc_repository_impl.dart';
import 'package:agenpo/data/repositories/warehouses_repository_impl.dart';

import 'package:agenpo/domain/repositories/kyc_repository.dart';
import 'package:agenpo/domain/repositories/wallet_repository.dart';
import 'package:agenpo/domain/repositories/auth_repository.dart';
import 'package:agenpo/domain/repositories/geolocate_farm_repository.dart';
import 'package:agenpo/domain/repositories/inventory_repository.dart';
import 'package:agenpo/domain/repositories/offers_repository.dart';
import 'package:agenpo/domain/repositories/profile_repository.dart';
import 'package:agenpo/domain/repositories/transactions_repository.dart';
import 'package:agenpo/domain/repositories/warehouses_repository.dart';

import 'package:agenpo/presentation/blocs/accept_offer/accept_offer_bloc.dart';
import 'package:agenpo/presentation/blocs/accept_offer/accept_offer_bloc.dart';
import 'package:agenpo/presentation/blocs/resolve_bank/resolve_bloc.dart';
import 'package:agenpo/presentation/blocs/wallet/wallet_bloc.dart';
import 'package:agenpo/presentation/blocs/auth/auth_bloc.dart';
import 'package:agenpo/presentation/blocs/geolocate_farm/geolocate_farm_bloc.dart';
import 'package:agenpo/presentation/blocs/inventory/inventory_bloc.dart';
import 'package:agenpo/presentation/blocs/offers/offers_bloc.dart';
import 'package:agenpo/presentation/blocs/profile/profile_bloc.dart';
import 'package:agenpo/presentation/blocs/transactions/transactions_bloc.dart';
import 'package:agenpo/presentation/blocs/warehouses/warehouses_bloc.dart';
import 'package:agenpo/presentation/blocs/kyc/kyc_bloc.dart';

import 'package:agenpo/presentation/journeys/common/landing.dart';

import 'package:agenpo/di/injector.dart' as di;

import 'package:agenpo/utils/router.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';

// const kGoogleApiKey = "AIzaSyC2V-j8HkCCRNRHkdBieVOjsG1uVnLZRZE";

Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();
	SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

	unawaited(di.init());

	final path = await getApplicationDocumentsDirectory();
	Hive.init(path.path);

	await Hive.openBox(
		DBConstants.appBoxName,
	);

	runApp(
			MultiRepositoryProvider(
				providers: [
					RepositoryProvider<AuthRepository>(
						create: (_) => AuthRepositoryImpl(dataSource: di.inject()),
					),
					RepositoryProvider<OffersRepository>(
						create: (_) => OffersRepositoryImpl(dataSource: di.inject()),
					),
					RepositoryProvider<TransactionsRepository>(
						create: (_) => TransactionsRepositoryImpl(dataSource: di.inject()),
					),
					RepositoryProvider<ProfileRepository>(
						create: (_) => ProfileRepositoryImpl(dataSource: di.inject()),
					),
					RepositoryProvider<GeoLocateFarmRepository>(
						create: (_) => GeoLocateFarmRepositoryImpl(dataSource: di.inject()),
					),
					RepositoryProvider<WarehousesRepository>(
						create: (_) => WarehousesRepositoryImpl(dataSource: di.inject()),
					),
					RepositoryProvider<InventoryRepository>(
						create: (_) => InventoryRepositoryImpl(dataSource: di.inject()),
					),
					RepositoryProvider<WalletRepository>(
						create: (_) => WalletRepositoryImpl(dataSource: di.inject()),
					),
					RepositoryProvider<KYCRepository>(
						create: (_) => KYCRepositoryImpl(dataSource: di.inject()),
					),
				],
				child: MultiBlocProvider(
					providers: [
						BlocProvider<AuthBloc>(
							create: (_) => AuthBloc(repository: di.inject()),
						),
						BlocProvider<OffersBloc>(
							create: (_) => OffersBloc(repository: di.inject()),
						),
						BlocProvider<AcceptOfferBloc>(
							create: (_) => AcceptOfferBloc(repository: di.inject()),
						),
						BlocProvider<TransactionsBloc>(
							create: (_) => TransactionsBloc(repository: di.inject()),
						),
						BlocProvider<ProfileBloc>(
							create: (_) => ProfileBloc(repository: di.inject()),
						),
						BlocProvider<GeolocateFarmBloc>(
							create: (_) => GeolocateFarmBloc(repository: di.inject()),
						),
						BlocProvider<WarehousesBloc>(
							create: (_) => WarehousesBloc(repository: di.inject()),
						),
						BlocProvider<InventoryBloc>(
							create: (_) => InventoryBloc(repository: di.inject()),
						),
						BlocProvider<WalletBloc>(
							create: (_) => WalletBloc(repository: di.inject()),
						),
						BlocProvider<ResolveBloc>(
							create: (_) => ResolveBloc(repository: di.inject()),
						),
						BlocProvider<KycBloc>(
							create: (_) => KycBloc(repository: di.inject()),
						),
					],
					child: const AgenpoHome(),
				),
			)
	);

}

class AgenpoHome extends StatelessWidget {

	const AgenpoHome({Key? key}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return const MaterialApp(
			title: "Agenpo",
			debugShowCheckedModeBanner: false,
			// theme: appTheme,
			// home: SelectUserRole(),
			home: Landing(),
			onGenerateRoute: AppRouter.generateRoute,
		);
	}

	// ScreenUtilInit(
	// 	minTextAdapt: true,
	// 	splitScreenMode: true,
	// 	builder: (context, child) => MaterialApp(
	// 		title: "Agenpo",
	// 		theme: appTheme,
	// 		locale: BuildContextEasyLocalizationExtension(context).locale,
	// 		// routerDelegate: _navigator,
	// 		supportedLocales: context.supportedLocales,
	// 		// backButtonDispatcher: RootBackButtonDispatcher(),
	// 		localizationsDelegates: context.localizationDelegates,
	// 		// routeInformationParser: VxInformationParser(),
	// 		debugShowCheckedModeBanner: false,
	// 		builder: (context, widget) {
	// 			ScreenUtil.init(context);
	//
	// 			AuthProvider _authProvider = context.watch<AuthProvider>();
	// 			currentUser = _authProvider.user;
	//
	// 			return MediaQuery(
	// 				data: MediaQuery.of(context).copyWith(textScaleFactor: .8),
	// 				child: widget!
	// 			);
	// 		}
	// 	)
	// );

}