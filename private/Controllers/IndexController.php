<?
namespace Choper78rus\Volex\Controllers;
use Choper78rus\Volex\Base\GenerateResponse;

class IndexController {
    private $item;
    
    public function __construct() {
        $this->item = new CatalogModel();
    }
    
    function indexAction() {
        $post = $_POST;
        $list = isset($post['list']) ? $post['list'] > 1 ? $post['list']:1 : 1;
        $categoty = !empty($post['action']) ? $post['action'] : NULL;
        $title = 'Главная';
        $view_filename = 'index_view.php'; // вид
        
        GenerateResponse::generateResponse($view_filename, [
            'title' => $title,
            'item' => $this->item->getItem($list, 4, NULL, $categoty),
            'list' => $list,
            'category' => $categoty
        ]);
    }
}

?>