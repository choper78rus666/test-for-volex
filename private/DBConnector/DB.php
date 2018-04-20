<?
namespace Choper78rus\Volex\DBConnector;
use PDO;

class DB {
    private $servername = 'localhost';
    private $db_name = 'Volex';
    private $username = 'root';
    private $pwd = '';
    
    function connectDB(){
        $conection = new PDO("mysql:host=$this->servername;dbname=$this->db_name", $this->username, $this->pwd);
        $sql = "CREATE TABLE IF NOT EXISTS questions (
        id INT AUTO_INCREMENT PRIMARY KEY,
        quest VARCHAR (100) NOT NULL);
        
        CREATE TABLE IF NOT EXISTS answers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        answer VARCHAR (100) NOT NULL,
        type VARCHAR (20) NOT NULL);
        
        CREATE TABLE IF NOT EXISTS variations(
        questions_id INT NOT NULL,
        answer_id INT NOT NULL,
        correct ENUM('true','false') NOT NULL,
        history INT DEFAULT '0' NOT NULL);
        ";
        
        $conection->exec($sql);
        return $conection;
    }
    
    function addSQL($params, $sql) {
        $connect = $this->connectDB();
        $statment = $connect->prepare($sql);
        return $statment->execute($params);
    }
    
    function getSQL($param=NULL, $sql, $all=false) {
        $connect = $this->connectDB();
        if(isset($param)){
            $statment = $connect->prepare($sql);
            $statment->execute($param);
            return $all ? $statment->fetchAll(PDO::FETCH_ASSOC) : $statment->fetch(PDO::FETCH_ASSOC);
        } else {
            $statment = $connect->query($sql);
            return $statment->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}

?>