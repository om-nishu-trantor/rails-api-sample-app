var toDoList = angular.module('toDoApp', []);

toDoList.controller('ToDoListCtrl', function ($scope, $http) {
    $http.get('/tasks.json').success(function (data) {
        $scope.todos = data;
    });

//    $http.post('/tasks.json').success(function (data) {
//        $scope.todos = data;
//    });

    $scope.submit = function () {
        debugger
        if ($scope.text) {

            $http.post('/tasks.json').success(function (data) {
                $scope.todos.push({name:})
            });

            $scope.todos.push({name: this.text});
            $scope.text = '';
        }
    };
});
