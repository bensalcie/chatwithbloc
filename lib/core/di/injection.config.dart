// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../home/bloc/gemini_bloc_bloc.dart' as _i240;
import '../../home/data/gemini_model_service.dart' as _i788;
import 'module_injection.dart' as _i237;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModules = _$RegisterModules();
    gh.singleton<String>(() => registerModules.apiKey, instanceName: 'ApiKey');
    gh.lazySingleton<_i788.GenerativeModelService>(
      () => registerModules.generativeModelService(
        gh<String>(instanceName: 'ApiKey'),
      ),
    );
    gh.factory<_i240.GeminiBlocBloc>(
      () => _i240.GeminiBlocBloc(gh<_i788.GenerativeModelService>()),
    );
    return this;
  }
}

class _$RegisterModules extends _i237.RegisterModules {}
