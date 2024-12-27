import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure_access/core/base_classes/base_repository.dart';
import 'package:secure_access_repository/models/repository_models.dart';

abstract class DashboardPageLoadVisitationsRepository  extends BaseRepository<DashboardPageLoadVisitationsRepositoryParams, Stream<QuerySnapshot<SecureAccessVisitationsModel?>>>{}

class DashboardPageLoadVisitationsRepositoryParams extends BaseRepositoryParams{}
