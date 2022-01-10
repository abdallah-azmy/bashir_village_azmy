part of 'comments_cubit.dart';


abstract class CommentsState {}

class CommentsInitial extends CommentsState {}
class CommentsLoadingState extends CommentsState {}
class CommentsSuccessState extends CommentsState {
  GetCommentByIddModel model;
  CommentsSuccessState({this.model});
}
class CommentsErrorState extends CommentsState {
  final String error;
  CommentsErrorState({this.error});
}

class AddCommentLoadingState extends CommentsState {}
class AddCommentSuccessState extends CommentsState {
  AddCommentModel model;
  AddCommentSuccessState({this.model});
}
class AddCommentErrorState extends CommentsState {
  final String error;
  AddCommentErrorState({this.error});
}

