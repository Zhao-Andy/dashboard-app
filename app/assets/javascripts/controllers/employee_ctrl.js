(function() {
  "use strict";

  angular.module("app").controller("employeeCtrl", function($scope, $http) {
    // Read/Index
    $scope.index = function() {
      $http.get('/api/employees.json').then(function(response) {
        $scope.employees = response.data;
      });
    };

    $scope.sort = "hiring_date";
    $scope.reverse = false;

    // Sort
    $scope.sortBy = function(column) {
      $scope.reverse = ($scope.sort == column) ? !$scope.reverse : false;
      $scope.sort = "hiring_date";
      $scope.sort = column;

    };

    $scope.sortByOrderArrow = function(column) {
      if ($scope.sort == column) {
        return $scope.reverse ? 'glyphicon glyphicon-chevron-up' : 'glyphicon glyphicon-chevron-down';
      }
      return '';
    };

    // Create
    $scope.createEmployee = function(employee, userId) {
      var params = {
        first_name: employee.firstName,
        last_name: employee.lastName,
        email: employee.email,
        hiring_date: employee.hiringDate,
        user_id: userId
      };
      $http.post('/api/employees', params);
      $scope.index();
    };

    // Edit/Update
    $scope.enableEdit = function() {

    };

    $scope.editEmployee = function(employee) {
      var params = {
        first_name: employee.firstName,
        last_name: employee.lastName,
        email: employee.email,
        hiring_date: employee.hiringDate
      };
      $http.patch('/api/employees.json', params);
      $scope.index();
    };

    // Delete
    $scope.deleteEmployee = function(employee) {
      $http.delete('/api/employees/' + employee.id.toString() + '.json');
      $scope.index();
    };

  });
})();
