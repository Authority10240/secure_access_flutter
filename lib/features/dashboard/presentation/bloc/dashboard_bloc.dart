import 'package:secure_access/core/base_classes/base_bloc.dart';
import 'package:secure_access/core/base_classes/base_event.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:secure_access/generated/l10n.dart';


part 'dashboard_event.dart';
part 'dashboard_state.dart';

@injectable
class DashboardBloc
    extends BaseBloc<DashboardPageEvent, DashboardPageState> {
    DashboardBloc(): super(DashboardPageInitState()) {}
} 
