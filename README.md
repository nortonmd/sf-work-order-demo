# Salesforce Integration with REST Services

This project contains documentation and code samples that demonstrate how to set up and integrate Salesforce with a RESTful service.

The scenario for this demonstration involves Salesforce making a callout to a Work Orders service hosted using MuleSoft's Mock Service.  
Details can be found in the [/docs](/docs/) folder, such as high level sequence diagrams, as well as step by step instructions on how to prepare your Salesforce Org to 'talk' to the Work Order Service.

The Work Order service is provided using a Mocking service according to the specs described in the [work-order-service.raml](/docs/work-order-service.raml) file.  The service can be created by dropping the .raml file into the API design in Anypoint Platform Design Center, then turning on the mocking service.  Code samples are provided for the methods described.

### Components

The following is a list of the key components:

```
├── README.md
├── config
│   └── project-scratch-def.json
├── docs
│   ├── work-order-service.raml
│   ├── wsd-1-salesforce-to-work-order-service.md
│   ├── wsd-2-curl-to-work-order-service.md
│   ├── wsd-3-salesforce-lwc-apex-to-work-order-service.md
│   ├── wsd-4-salesforce-development.md
├── force-app
│   └── main
│       └── default
│           ├── classes
│           │   ├── WorkOrder.cls
│           │   ├── WorkOrder.cls-meta.xml
│           │   ├── WorkOrderDataService.cls
│           │   └── WorkOrderDataService.cls-meta.xml
│           ├── lwc
│           │   ├── basic
│           │   │   ├── basic.html
│           │   │   ├── basic.js
│           │   │   ├── basic.js-meta.xml
│           │   │   └── fetchDataHelper.js
│           │   └── searchWorkOrders
│           │       ├── searchWorkOrders.css
│           │       ├── searchWorkOrders.html
│           │       ├── searchWorkOrders.js
│           │       └── searchWorkOrders.js-meta.xml
│           └── triggers
├── scripts
│   ├── call-fetch.apex
│   └── query-work-orders.soql
└── sfdx-project.json
```

The call flow is as follows:

* The `searchWorkOrders` Lightning Web Component binds the WorkOrderDataService to the JavaScript method `queryWorkOrders`.
* The Apex method `WorkOrderDataService.queryWorkOrdersByCustomer()` creates an HttpRequest that hits the Work Order REST Service.
* The mock response is passed back the caller (the apex method) in JSON format, where it is deserialized into the structural class `WorkOrder`. 
* The apex code then inflates a collect of `Work_Order__c` records (an SObject for structure only).
* The collection is passed back to the LWC controller and view where it is rendered.





