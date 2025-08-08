import 'package:delivery/models/response_model.dart';
import 'package:delivery/models/signup_body_model.dart';
import 'package:delivery/repository/uath_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    print("getteng token");
    print(authRepo.getUserToken().toString());
    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    late ResponseModel responseModel;
    print("backend incorrect");
    if (response.statusCode == 200) {
      print("backend token");

      authRepo.saveUserToken(response.body["token"]);
      print("infox de backend ne passe pas");
      print(response.body["token"].toString());
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();

    return responseModel;
  }

  void saveUserEmailAndPassword(String email, String password) {
    authRepo.saveUserNumberAndPassword(email, password);
  }
}
