//FetchData.get();


/*
AnimalCallouts.makeGetCallout();
AnimalCallouts.makePostCallout();
*/

//MuleSoftProductQuery.getProductInfo();

//MuleSoftProductQuery.getProductInfoWithNamedCredentials();

//MuleSoftProductQuery.postProductInfoWithNamedCredentials();

/*
String workOrderId = '1234567890';
String workOrderStatus = WorkOrderDataService.queryWorkOrderStatus( workOrderId);
System.debug( 'Work Order Status is [' + workOrderStatus + ']');
 */

String customerId = '123';
List<Work_Order__c> workOrders = new List<Work_Order__c>();
workOrders = WorkOrderDataService.queryWorkOrdersByCustomer( customerId);

System.debug( 'Size of workOrders is ' + workOrders.size());
System.debug( 'The returned work orders are ' + workOrders);



