import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController extends Cubit<bool> {
  AppController() : super(true);
}
