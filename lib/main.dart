import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim_generator/data/entity/edited_meme.dart';
import 'package:mim_generator/data/repository/impl/meme_repository_impl.dart';
import 'package:mim_generator/data/repository/meme_repository.dart';
import 'package:mim_generator/data/source/local/impl/meme_dao_impl.dart';
import 'package:mim_generator/data/source/local/meme_dao.dart';
import 'package:mim_generator/data/source/local/objectbox.dart';
import 'package:mim_generator/data/source/network/chopper_service.dart';
import 'package:mim_generator/data/source/network/meme_service.dart';
import 'package:mim_generator/domain/get_meme.dart';
import 'package:mim_generator/domain/impl/get_meme_impl.dart';
import 'package:mim_generator/presenter/view/meme/bloc/meme_bloc.dart';
import 'package:mim_generator/presenter/view/meme/meme_page.dart';
import 'package:mim_generator/util/constants/routes.dart';

import 'objectbox.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ObjectBox objectBox = await ObjectBox.create();

  runApp(MyApp(objectBox));
}

class MyApp extends StatelessWidget {
  final ObjectBox _objectBox;

  const MyApp(this._objectBox, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<ObjectBox>(create: (_) => _objectBox),
        RepositoryProvider<Box<EditedMeme>>(
            create: (ctx) => ctx.read<ObjectBox>().store.box<EditedMeme>()),
        RepositoryProvider<MemeDao>(create: (ctx) => MemeDaoImpl(ctx.read())),
        RepositoryProvider<ChopperClient>(create: (_) => chopperClient()),
        RepositoryProvider<MemeService>(
            create: (ctx) =>
                ctx.read<ChopperClient>().getService<MemeService>()),
        RepositoryProvider<MemeRepository>(
            create: (ctx) => MemeRepositoryImpl(ctx.read(), ctx.read())),
        RepositoryProvider<GetMeme>(create: (ctx) => GetMemeImpl(ctx.read())),
        BlocProvider(create: (ctx) => MemeBloc(ctx.read()))
      ],
      child: MaterialApp(
        title: 'Mim Generator',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins"),
        routes: {Routes.meme: (ctx) => MemePage()},
        initialRoute: Routes.meme,
      ),
    );
  }
}