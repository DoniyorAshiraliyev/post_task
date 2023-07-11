import 'package:flutter/material.dart';
import 'package:post_task/common/data/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:post_task/features/posts/data/repository/post_repository_impl.dart';
import 'package:post_task/features/posts/domain/usecase/get_all_post_usecase.dart';
import 'package:post_task/features/posts/presentation/controller/post_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PostController>(
          create: (_) => PostController(
            useCase: GetAllPostUsecase(
              repository: PostRepositoryImpl(
                remoteDataSource: RemoteDataSourceImpl(),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PostController>(
        builder: (context, controller, _) {
          return Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: controller.list.length,
                itemBuilder: (BuildContext context, int index) {
                  final post = controller.list[index];
                  return Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.cyan.shade300,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Post Title:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(post.title),
                        Text(
                          "Post Body:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          post.body,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  );
                },
              ),
              if (controller.isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
