//var toDoList = angular.module('toDoApp', []);
//
//$.getJSON('/tasks', function(tasks){  $.each(tasks, function() { taskArr.push(this) })});
//toDoList.controller('ToDoListCtrl', function ($scope)) {
////    $scope.todos=taskArr;
//    $scope.todos=[{"name":"asd", "id":"qwe"}]
//
//
//}
//

taskArr=[];

//$http({method: 'GET', url: '/someUrl'}).
//    success(function(data, status, headers, config) {
//        // this callback will be called asynchronously
//        // when the response is available
//    }).
//    error(function(data, status, headers, config) {
//        // called asynchronously if an error occurs
//        // or server returns response with an error status.
//    });

//$.getJSON('/tasks', function(tasks){  $.each(tasks, function() { taskArr.push(this)})});
//var toDoList = angular.module('toDoApp', []);

var toDoList = angular.module('toDoApp', []);

toDoList.controller('ToDoListCtrl', function ($scope, $http) {
    $http.get('/tasks').success(function(response){console.log(repsonse)});
debugger
    $scope.todos = [
//        asd
        {"name":"asd", "id":1}
    ];
});