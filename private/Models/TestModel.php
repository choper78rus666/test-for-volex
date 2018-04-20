<?
namespace Choper78rus\Volex\Models;
use Choper78rus\Volex\DBConnector\DB;

class TestModel {
    private $db;
    
    public function __construct(){
        $this->db = new DB();
    }
    
    function getStats(){
        $sql = "select * from variations Left join questions ON questions_id = id Left join answers ON answer_id = answers.id;";
        return $this->db->getSQL(NULL, $sql);
    }
}
?>