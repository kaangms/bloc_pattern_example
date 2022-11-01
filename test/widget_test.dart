import 'package:bloc_pattern_example/features/user/view/user_view.dart';
import 'package:bloc_pattern_example/product/routing/navigator/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UserView page smoke test', (WidgetTester tester) async {
    // Build widget to test for
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (context) => NavigationBloc(),
        child: UserView(),
      ),
    ));

    // Test the widget built
    expect(find.text('Kullanıcı Listesi'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(0));
    expect(find.byType(InkWell), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 1000));
    await tester.tap(find.byType(InkWell));
  });
}
