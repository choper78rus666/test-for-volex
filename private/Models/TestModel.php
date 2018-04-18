<?
namespace Choper78rus\Volex\Models;
use Choper78rus\Volex\DBConnector\DB;

class TestModel {
    private $db;
    
    public function __construct(){
        $this->db = new DB();
    }
    
}
?>