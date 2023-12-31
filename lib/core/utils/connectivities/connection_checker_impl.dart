import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:post_task/core/utils/connectivities/connection_checker.dart';

class ConnectionCheckerImpl implements ConnectionChecker{
  final Connectivity connectivity;
  const ConnectionCheckerImpl(this.connectivity);


  @override
  Future<bool> check() async {
    final result=await connectivity.checkConnectivity();
    return result ==ConnectivityResult.wifi||result==ConnectivityResult.mobile;
    
    // TODO: implement check
    throw UnimplementedError();
  }


}