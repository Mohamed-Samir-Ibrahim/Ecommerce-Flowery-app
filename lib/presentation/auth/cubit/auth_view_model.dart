import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signup/signup_entity.dart';
import 'package:flowery/domain/use_case/auth_use_case/signup_use_case.dart';
import 'package:flowery/presentation/auth/cubit/auth_intent.dart';
import 'package:flowery/presentation/auth/cubit/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class AuthViewModel extends Cubit<AuthStates>{
  SignUpUseCase signUpUseCase;
  TextEditingController fristName= TextEditingController();
  TextEditingController lastname= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController rePassword= TextEditingController();
  TextEditingController phone= TextEditingController();
  String SelectedGender='female';
SignupEntity? signupEntity;
  AuthViewModel({required this.signUpUseCase}):super(AuthInitialStates());
  void SignUp()async{
emit(SignUpLoadingState());
   var result = await signUpUseCase.SignUp(fristName.text, lastname.text, email.text, password.text, rePassword.text, phone.text, SelectedGender);
    switch(result){

      case Success():{

        emit(SignUpSuccessState(signUpResponseEntity: result.data!));

// if(result.data?.message=='success') {
// }else {
// emit(SignUpErrorState(exception: result.data!.error??"ErrorMsg"));
//
// }
      }
      case Failure():{

        emit(SignUpErrorState(exception:signupEntity!.error ));
      }
    }




      }

  void dointent(AuthIntent auth){

    switch(auth){
      case SignUpIntent():{

        SignUp();

      }
    }

  }


}