var app = angular.module('MyApp', ['angularUtils.directives.dirPagination']);

app.factory('crudServiceEmployees', function ($http) {
    crudEmpObj = {};

    crudEmpObj.getAll = function () {
        var Emps;

        Emps = $http({ method: 'Get', url: '/Employees/Index' }).
        then(function (response) {
            return response.data;
        });

        return Emps;
    };

    crudEmpObj.getByEid = function (eid) {
        var Emp;

        Emp = $http({ method: 'Get', url: '/Employees/Details/', params: { id: eid } }).
        then(function (response) {
            return response.data;
        });

        return Emp;
    };

    crudEmpObj.deleteByEid = function (eid) {
        var Emp;

        Emp = $http({ method: 'Post', url: '/Employees/Delete/', params: { id: eid } }).
        then(function (response) {
            return response.data;
        });

        return Emp;
    };

    crudEmpObj.createEmployee = function (emp) {
        var Emp;

        Emp = $http({ method: 'Post', url: '/Employees/Create/', data: emp }).
        then(function (response) {
            return response.data;
        });

        return Emp;
    };

    crudEmpObj.updateEmployee = function (emp) {
        var Emp;

        Emp = $http({ method: 'Post', url: '/Employees/Edit/', data: emp }).
        then(function (response) {
            return response.data;
        });

        return Emp;
    };

    return crudEmpObj;
});

app.controller('employeesController', function ($scope, crudServiceEmployees) {

    crudServiceEmployees.getAll().then(function (result) {
        $scope.Emps = result;
    });

    $scope.GetByEid = function(eid) {
        crudServiceEmployees.getByEid(eid).then(function (result) {
            result.EDOB = new Date(parseInt(result.EDOB.substr(6)));
            $scope.Emp = result;
        });
    };

    $scope.DeleteByEid = function (eid) {
        crudServiceEmployees.deleteByEid(eid).then(function (result) {
            $scope.Msg = result.EName +"Has been deleted successfully";

            crudServiceEmployees.getAll().then(function (result) {
                $scope.Emps = result;
            });
        });        
    };

    $scope.CreateEmployee = function (Emp, isValid) {
        if (isValid) {
            crudServiceEmployees.createEmployee(Emp).then(function (result) {
                if (result.Eid != null) {
                    $scope.Msg = result.EName + " Has been created successfully";

                    crudServiceEmployees.getAll().then(function (result) {
                        $scope.Emps = result;

                    });
                }
                else {
                    alert(result);
                    $scope.errorMsgs = result;
                }
            });
        }
    };

    $scope.UpdateEmployee = function (Emp) {
        crudServiceEmployees.updateEmployee(Emp).then(function (result) {
            $scope.Msg = result.EName + " Has been updated successfully";

            crudServiceEmployees.getAll().then(function (result) {
                $scope.Emps = result;
            });
        });
    };
});
