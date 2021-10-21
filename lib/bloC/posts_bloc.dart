import 'package:api_app/models/post_model.dart';
import 'package:api_app/services/posts_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'dart:async';

// import 'package:api_app/models/post_model.dart';
// import 'package:api_app/services/posts_repo.dart';

// class PostsBLoC {
//   Stream<dynamic> get PostsList async* {
//     yield await PostsService.getData();
//   }

//   final StreamController<int> _userCounter = StreamController<int>();

//   Stream<int> get userCounter => _userCounter.stream;

//   PostsBLoC() {
//     PostsList.listen((list) => _userCounter.add(list.length));
//   }
// }

class PostsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchPosts extends PostsEvent {
  final _post;

  FetchPosts(this._post);

  @override
  // TODO: implement props
  List<Object> get props => [_post];
}

class ResetPost extends PostsEvent {}

class PostState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PostIsNotSearched extends PostState {}

class PostIsLoading extends PostState {}

class PostIsLoaded extends PostState {
  // final _post;
  List<PostModel> posts;
  PostIsLoaded(this.posts);

  // PostModel get getPost => posts;

  @override
  // TODO: implement props
  List<Object> get props => [posts];
}

class PostIsNotLoaded extends PostState {}

class PostBloc extends Bloc<PostsEvent, PostState> {
  late PostsService postRepo;

  PostBloc(postRepo)
      : assert(postRepo != null),
        super(PostIsNotLoaded());

  //PostBloc(this.postRepo);

  // @override
  // TODO: implement initialState
  PostState get initialState => PostIsNotSearched();

  @override
  Stream<PostState> mapEventToState(PostsEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchPosts) {
      yield PostIsLoading();

      try {
        List<PostModel> post = await PostsService.getData();

        print(post);
        yield PostIsLoaded(post);
      } catch (_) {
        print(_);
        yield PostIsNotLoaded();
      }
    } else if (event is ResetPost) {
      yield PostIsNotSearched();
    }
  }
}
