<?
namespace Choper78rus\Volex\Models;
use Choper78rus\Volex\DBConnector\DB;

class TestModel {
    private $db;
    
    public function __construct(){
        $this->db = new DB();
    }
    
    function getStats(){
        $sql = "SELECT * FROM variations LEFT JOIN questions ON questions_id = id LEFT JOIN answers ON answer_id = answers.id;";
        return $this->db->getSQL(NULL, $sql);
    }
    
    function addTest($post){
        
        $resault = [
            'yes'=> 0,
            'no' => 0
        ];
        
        foreach($post as $value){
            foreach($value as $id){
                $sql = "SELECT history, correct, answer_id FROM variations WHERE answer_id = :id OR answer_id = (SELECT id FROM answers WHERE answer =:id);";
                $res = $this->db->getSQL(['id'=>$id], $sql);
                $find = (int)$res['history'] + 1;
                
                if($res['correct'] === 'true'){
                    $resault['yes']++;
                } else {
                    $resault['no']++;
                }
                
                $sql = "UPDATE variations SET history =:find WHERE answer_id =:id;";
                $this->db->addSQL(['find'=>$find, 'id'=>$res['answer_id']], $sql);
            }
        }
        
    return $resault;
    }
}
?>