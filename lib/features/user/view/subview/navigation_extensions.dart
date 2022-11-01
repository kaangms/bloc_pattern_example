part of '../user_view.dart';

extension UserViewNavigateToUserDetailViewExtension on UserViewNavigateToUserDetailView {
  Future<void> navigateToUserDetailView(BuildContext context, UserModel userModel) async {
    context.read<NavigationBloc>().add(NavigateToUserDetailView(userModel: userModel));
  }
}
