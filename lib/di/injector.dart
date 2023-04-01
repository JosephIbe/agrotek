import 'package:agenpo/data/data_sources/inventory_remote_data_source.dart';
import 'package:agenpo/data/data_sources/kyc_remote_data_source.dart';
import 'package:agenpo/data/data_sources/wallet_remote_data_source.dart';
import 'package:agenpo/data/repositories/inventory_repository_impl.dart';
import 'package:agenpo/data/repositories/kyc_repository_impl.dart';
import 'package:agenpo/data/repositories/wallet_repository_impl.dart';
import 'package:agenpo/domain/repositories/inventory_repository.dart';
import 'package:agenpo/domain/repositories/kyc_repository.dart';
import 'package:agenpo/domain/repositories/wallet_repository.dart';
import 'package:agenpo/presentation/blocs/accept_offer/accept_offer_bloc.dart';
import 'package:agenpo/presentation/blocs/inventory/inventory_bloc.dart';
import 'package:agenpo/presentation/blocs/kyc/kyc_bloc.dart';
import 'package:agenpo/presentation/blocs/resolve_bank/resolve_bloc.dart';
import 'package:agenpo/presentation/blocs/wallet/wallet_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:agenpo/data/core/api_client.dart';

import 'package:agenpo/data/data_sources/auth_remote_data_source.dart';
import 'package:agenpo/data/data_sources/offers_remote_data_source.dart';
import 'package:agenpo/data/data_sources/transactions_remote_data_source.dart';
import 'package:agenpo/data/data_sources/geolocate_farm_remote_data_source.dart';
import 'package:agenpo/data/data_sources/profile_remote_data_source.dart';
import 'package:agenpo/data/data_sources/warehouses_remote_data_source.dart';

import 'package:agenpo/data/repositories/auth_repository_impl.dart';
import 'package:agenpo/data/repositories/offers_repository_impl.dart';
import 'package:agenpo/data/repositories/transactions_repository_impl.dart';
import 'package:agenpo/data/repositories/geolocate_farm_repository_impl.dart';
import 'package:agenpo/data/repositories/profile_repository_impl.dart';
import 'package:agenpo/data/repositories/warehouses_repository_impl.dart';

import 'package:agenpo/domain/repositories/auth_repository.dart';
import 'package:agenpo/domain/repositories/offers_repository.dart';
import 'package:agenpo/domain/repositories/transactions_repository.dart';
import 'package:agenpo/domain/repositories/geolocate_farm_repository.dart';
import 'package:agenpo/domain/repositories/profile_repository.dart';
import 'package:agenpo/domain/repositories/warehouses_repository.dart';

import 'package:agenpo/presentation/blocs/auth/auth_bloc.dart';
import 'package:agenpo/presentation/blocs/offers/offers_bloc.dart';
import 'package:agenpo/presentation/blocs/transactions/transactions_bloc.dart';
import 'package:agenpo/presentation/blocs/geolocate_farm/geolocate_farm_bloc.dart';
import 'package:agenpo/presentation/blocs/profile/profile_bloc.dart';
import 'package:agenpo/presentation/blocs/warehouses/warehouses_bloc.dart';

final inject = GetIt.I;

Future init() async {

  inject.registerLazySingleton<APIClient>(() => APIClient());

  inject.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(client: inject()));
  inject.registerLazySingleton<OffersRemoteDataSource>(() => OffersRemoteDataSourceImpl(client: inject()));
  inject.registerLazySingleton<TransactionsRemoteDataSource>(() => TransactionsRemoteDataSourceImpl(client: inject()));
  inject.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(client: inject()));
  inject.registerLazySingleton<GeoLocateFarmRemoteDataSource>(() => GeoLocateFarmRemoteDataSourceImpl(client: inject()));
  inject.registerLazySingleton<WarehousesRemoteDataSource>(() => WarehousesRemoteDataSourceImpl(client: inject()));
  inject.registerLazySingleton<InventoryRemoteDataSource>(() => InventoryRemoteDataSourceImpl(client: inject()));
  inject.registerLazySingleton<WalletRemoteDataSource>(() => WalletRemoteDataSourceImpl(client: inject()));
  inject.registerLazySingleton<KYCRemoteDataSource>(() => KYCRemoteDataSourceImpl(client: inject()));

  inject.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: inject()));
  inject.registerLazySingleton<OffersRepository>(() => OffersRepositoryImpl(dataSource: inject()));
  inject.registerLazySingleton<TransactionsRepository>(() => TransactionsRepositoryImpl(dataSource: inject()));
  inject.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(dataSource: inject()));
  inject.registerLazySingleton<GeoLocateFarmRepository>(() => GeoLocateFarmRepositoryImpl(dataSource: inject()));
  inject.registerLazySingleton<WarehousesRepository>(() => WarehousesRepositoryImpl(dataSource: inject()));
  inject.registerLazySingleton<InventoryRepository>(() => InventoryRepositoryImpl(dataSource: inject()));
  inject.registerLazySingleton<WalletRepository>(() => WalletRepositoryImpl(dataSource: inject()));
  inject.registerLazySingleton<KYCRepository>(() => KYCRepositoryImpl(dataSource: inject()));

  inject.registerFactory(() => AuthBloc(repository: inject()));
  inject.registerFactory(() => OffersBloc(repository: inject()));
  inject.registerFactory(() => AcceptOfferBloc(repository: inject()));
  inject.registerFactory(() => TransactionsBloc(repository: inject()));
  inject.registerFactory(() => ProfileBloc(repository: inject()));
  inject.registerFactory(() => GeolocateFarmBloc(repository: inject()));
  inject.registerFactory(() => WarehousesBloc(repository: inject()));
  inject.registerFactory(() => InventoryBloc(repository: inject()));
  inject.registerFactory(() => WalletBloc(repository: inject()));
  inject.registerFactory(() => ResolveBloc(repository: inject()));
  inject.registerFactory(() => KycBloc(repository: inject()));

}