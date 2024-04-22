import 'package:daleel_store/app/features/wallet/data/operations_data.dart';
import 'package:daleel_store/app/features/wallet/domin/models/operation_model.dart';

class OperationsRepository {
  List<Operation> getOperations() {
    List<Operation> operationsObjects = [];
    for (var element in operationsList) {
      operationsObjects.add(Operation.fromJson(element));
    }

    return operationsObjects;
  }
}
