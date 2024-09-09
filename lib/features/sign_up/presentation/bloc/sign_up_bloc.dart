import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access/features/sign_up/domain/use_cases/sign_up_usecase/sign_up_clicked_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc
    extends BaseBloc<SignUpPageEvent, SignUpPageState> {
    SignUpBloc({required this.signUpClickedUseCase}): super(SignUpPageInitState()) {
        on<SignUpClickedEvent>((event,emit)=> _onSignUpClickedEvent(event,emit));

    }

    final SignUpClickedUseCase signUpClickedUseCase;

    Future<void> _onSignUpClickedEvent(
        SignUpClickedEvent event,
        Emitter<SignUpPageState> emit
        )async{
        emit(SignUpClickedState()..dataState = DataState.loading);
        signUpClickedUseCase.call(onSuccess: (model){
            emit(SignUpClickedState(userCredential: model)..dataState = DataState.success);
        }, onError: (error){
            emit(SignUpClickedState(errorCode:  error?.errorCode!, errorMessage:error?.message )..dataState = DataState.error);
        },
        params: SignUpClickedUseCaseParams(password: event.password, username: event.username));
    }
} 
