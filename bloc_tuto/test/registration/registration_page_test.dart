import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_tuto/registration/bloc/registration_bloc.dart';
import 'package:bloc_tuto/registration/model/registration_model.dart';
import 'package:bloc_tuto/registration/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRegistrationBloc
    extends MockBloc<RegistrationEvent, RegistrationState>
    implements RegistrationBloc {}

void main() {
  RegistrationBloc bloc;
  group('Registration Page - userName Changed', () {
    setUp(() {
      bloc = MockRegistrationBloc();
    });

    testWidgets('user name changed', (WidgetTester tester) async {
      const String userName = 'userName';
      RegistrationPage page = RegistrationPage();
      when(bloc.add(UserNameChanged(userName))).thenAnswer((_) =>
          RegistrationModelChanged(RegistrationModel.empty()
              .copyWith(isValid: true, userName: userName)));

      await tester.pumpWidget(BlocProvider.value(
          value: bloc,
          child: MaterialApp(
            home: page,
          )));

      await tester.pumpAndSettle();

      var finder = find.byType(TextField);

      expect(finder, findsNWidgets(3));

      await tester.enterText(finder.at(0), userName);

      verify(
        bloc.add(UserNameChanged(userName)),
      ).called(1);
    });
  });

  group('Registration Page - password Changed', () {
    setUp(() {
      bloc = MockRegistrationBloc();
    });

    testWidgets('password changed', (WidgetTester tester) async {
      const String password = 'password';
      RegistrationPage page = RegistrationPage();
      when(bloc.add(PasswordChanged(password))).thenAnswer((_) =>
          RegistrationModelChanged(RegistrationModel.empty()
              .copyWith(isValid: true, password: password)));

      await tester.pumpWidget(BlocProvider.value(
          value: bloc,
          child: MaterialApp(
            home: page,
          )));

      await tester.pumpAndSettle();

      var finder = find.byType(TextField);

      expect(finder, findsNWidgets(3));

      await tester.enterText(finder.at(1), password);

      verify(
        bloc.add(PasswordChanged(password)),
      ).called(1);
    });
  });

  group('Registration Page - confirm password Changed', () {
    setUp(() {
      bloc = MockRegistrationBloc();
    });

    testWidgets('confirm password changed', (WidgetTester tester) async {
      const String confirmPassword = 'confirmPassword';
      RegistrationPage page = RegistrationPage();
      when(bloc.add(ConfirmPasswordChanged(confirmPassword))).thenAnswer((_) =>
          RegistrationModelChanged(RegistrationModel.empty()
              .copyWith(isValid: true, confirmPassword: confirmPassword)));

      await tester.pumpWidget(BlocProvider.value(
          value: bloc,
          child: MaterialApp(
            home: page,
          )));

      await tester.pumpAndSettle();

      var finder = find.byType(TextField);

      expect(finder, findsNWidgets(3));

      await tester.enterText(finder.at(2), confirmPassword);

      verify(
        bloc.add(ConfirmPasswordChanged(confirmPassword)),
      ).called(1);
    });
  });
}
