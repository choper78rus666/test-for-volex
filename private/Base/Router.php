<?
namespace Choper78rus\Volex\Base;
use Choper78rus\Volex\Controllers\IndexController;

class Router{
    
    static function run(){
        $controller = 'Index';
        $action = 'index';
        $get = "";
        
        $routes = explode('/', $_SERVER['REQUEST_URI']);
        
        if(!empty($routes[1])){
            $controller = $routes[1]; // имя контроллера
        }
        
        if(!empty($routes[2])){
            $action = $routes[2]; // имя метода
        }
        
        $controller = ucfirst(strtolower($controller)) . 'Controller';
        $controller = 'Choper78rus\Volex\Controllers\\' . $controller;
        $action = strtolower($action) . 'Action';
        
        if(class_exists($controller)){
            $controller = new $controller();
        } else {
            $controller = new IndexController();
            $controller->indexAction();
        }
        
        if(method_exists($controller, $action)){
            $controller->$action($get);
        } else {
            $controller = new IndexController();
            $controller->indexAction();
        }
    }
}

?>