angular.module('slatwalladmin')
.directive('swWorkflowTriggers', 
[
'$log',
'$location',
'$slatwall',
'alertService',
'workflowService',
'workflowTriggerService',
'workflowPartialsPath',
function(
$log,
$location,
$slatwall,
alertService,
workflowService,
workflowTriggerService,
workflowPartialsPath
){
	return {
		require:"^form",
		restrict: 'A',
		scope:{
			
		},
		templateUrl:workflowPartialsPath+"workflowtriggers.html",
		link: function(scope, element,attrs,formController){
			$log.debug('workflow triggers init');	
			
			scope.workflowID = $location.search().workflowID;
			scope.$id = 'swWorkflowTriggers'
				
			scope.showEntityOptions = false;
				
			/*scope.getPropertyDisplayData = function(){
				var propertyDisplayDataPromise = $slatwall.getPropertyDisplayData('workflowTrigger',{propertyIdentifiersList:'triggerType'});
				propertyDisplayDataPromise.then(function(value){
					scope.propertyDisplayData = value.data;
					$log.debug('getting property Display meta data');
					$log.debug(scope.propertyDisplayData);
				},function(reason){
					var messages = reason.MESSAGES;
					var alerts = alertService.formatMessagesToAlerts(messages);
					alertService.addAlers(alerts);
				});
			};
			scope.getPropertyDisplayData();*/
				
			scope.getWorkflowTriggers = function(){
				var filterGroupsConfig ='['+  
					'{'+
                     	'"filterGroup":['+  
				            '{'+
				               '"propertyIdentifier":"workflow.workflowID",'+
				               '"comparisonOperator":"=",'+
				               '"value":"'+scope.workflowID+'"'+
				           '}'+ 
				         ']'+
					'}'+
				']';
				var workflowTriggerPromise = $slatwall.getEntity('workflowTrigger',{filterGroupsConfig:filterGroupsConfig});
				
				workflowTriggerPromise.then(function(value){
					$log.debug('getWorkflowTriggers');
					scope.workflowTriggers = workflowTriggerService.formatWorkflowTriggers(value.pageRecords);
					$log.debug(scope.workflowTriggers);
					
				},function(reason){
					//display error message if getter fails
					var messages = reason.MESSAGES;
					var alerts = alertService.formatMessagesToAlerts(messages);
					alertService.addAlerts(alerts);
				});
			};
			
			scope.getWorkflowTriggers();
			
			scope.showCollections = false;
			scope.collections = [];
			
			scope.getCollectionByWorkflowObject = function(){
				var filterGroupsConfig ='['+  
					'{'+
	                 	'"filterGroup":['+  
				            '{'+
				               '"propertyIdentifier":"Collection.collectionObject",'+
				               '"comparisonOperator":"=",'+
				               '"value":"Slatwall'+ scope.workflowTriggers.selectedTrigger.workflow.workflowObject +'"'+
				           '}'+ 
				         ']'+
					'}'+
				']';
				var collectionsPromise = $slatwall.getEntity('Collection',{filterGroupsConfig:filterGroupsConfig});
				
				collectionsPromise.then(function(value){
					$log.debug('getcollections');
					scope.collections = value.pageRecords;
					$log.debug(scope.collections);
					
				},function(reason){
					//display error message if getter fails
					var messages = reason.MESSAGES;
					var alerts = alertService.formatMessagesToAlerts(messages);
					alertService.addAlerts(alerts);
				});
			};
			
			scope.selectCollection = function(collection){
				$log.debug('selectCollection');
				scope.workflowTriggers.selectedTrigger.scheduleCollection = collection;
				scope.showCollections = false;
			}
			
			scope.addWorkflowTrigger = function(){
				$log.debug('addWorkflowTrigger');
				var newWorkflowTrigger = workflowTriggerService.newWorkflowTrigger();
				newWorkflowTrigger.workflow = workflowService.getWorkflow(scope.workflowID);
				scope.workflowTriggers.selectedTrigger = newWorkflowTrigger;
				scope.workflowTriggers.push(newWorkflowTrigger);
				$log.debug(scope.workflowTriggers);
			};
			
			scope.removeWorkflowTrigger = function(workflowTrigger){
				if(workflowTrigger === scope.workflowTriggers.selectedTrigger){
					delete scope.workflowTriggers.selectedTrigger;
				}
				scope.workflowTriggers.splice(workflowTrigger.$$index,1);
			};
		}
	};
}]);
	
