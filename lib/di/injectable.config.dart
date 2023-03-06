// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cat_facts/app/network/dio_container.dart' as _i8;
import 'package:cat_facts/features/authorization/data/services/android_authorization_service.dart'
    as _i6;
import 'package:cat_facts/features/authorization/data/services/ios_authorization_service.dart'
    as _i5;
import 'package:cat_facts/features/authorization/data/services/mock_authorization_service.dart'
    as _i7;
import 'package:cat_facts/features/authorization/domain/services/authorization_service.dart'
    as _i3;
import 'package:cat_facts/features/cat_facts/data/api/cat_facts_api.dart'
    as _i9;
import 'package:cat_facts/features/cat_facts/data/services/cat_facts_repository_impl.dart'
    as _i11;
import 'package:cat_facts/features/cat_facts/domain/services/cat_facts_repository.dart'
    as _i10;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _prod = 'prod';
const String _test = 'test';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factoryParam<_i3.AuthorizationService, _i4.BuildContext, dynamic>(
      (
        context,
        _,
      ) =>
          _i5.IosAuthorizationService(context: context),
      instanceName: 'iOS',
      registerFor: {_prod},
    );
    gh.factory<_i3.AuthorizationService>(
      () => _i6.AndroidAuthorizationService(),
      instanceName: 'Android',
      registerFor: {_prod},
    );
    gh.factory<_i3.AuthorizationService>(
      () => _i7.MockAuthorizationService(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i8.DioContainer>(() => _i8.DioContainer());
    gh.factory<_i9.CatFactsApi>(() => _i9.CatFactsApi(gh<_i8.DioContainer>()));
    gh.factory<_i10.CatFactsRepository>(
        () => _i11.CatFactsRepositoryImpl(gh<_i9.CatFactsApi>()));
    return this;
  }
}
