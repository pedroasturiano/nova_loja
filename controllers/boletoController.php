<?php

class boletoController extends controller {

    private $user;

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $store = new Store();
        $users = new Users();
        $cart = new Cart();
        $purchases = new Purchases();

        $dados = $store->getTemplateData();
        $dados['error'] = '';

        if (!empty($_POST['name'])) {

            $name = addslashes($_POST['name']);
            $cpf = addslashes($_POST['cpf']);
            $telefone = addslashes($_POST['telefone']);
            $email = addslashes($_POST['email']);
            $pass = addslashes($_POST['pass']);
            $cep = addslashes($_POST['cep']);
            $rua = addslashes($_POST['rua']);
            $numero = addslashes($_POST['numero']);
            $complemento = addslashes($_POST['complemento']);
            $bairro = addslashes($_POST['bairro']);
            $cidade = addslashes($_POST['cidade']);
            $estado = addslashes($_POST['estado']);

            if ($users->emailExists($email)) {
                $uid = $users->validate($email, $pass);

                if (empty($uid)) {
                    $dados['error'] = 'E-mail e/ou senha não conferem.';
                }
            } else {
                $uid = $users->createUser($email, $pass);
            }

            if (!empty($uid)) {

                $list = $cart->getList();
                $frete = 0;
                $total = 0;

                foreach ($list as $item) {
                    $total += (floatval($item['price']) * intval($item['qt']));
                }

                if (!empty($_SESSION['shipping'])) {
                    $shipping = $_SESSION['shipping'];

                    if (isset($shipping['price'])) {
                        $frete = floatval(str_replace(',', '.', $shipping['price']));
                    } else {
                        $frete = 0;
                    }

                    $total += $frete;
                }

                $id_purchase = $purchases->createPurchase($uid, $total, 'paypal');

                foreach ($list as $item) {
                    $purchases->addItem($id_purchase, $item['id'], $item['qt'], $item['price']);
                }

                global $config;
                
                $options = array(
                    'client_id' => $config['gerencianet_Clientid'],
                    'client_secret' => $config['gerencianet_clientsecret'],
                    'sandbox' => $config['gerencianet_sandbox']
                );
                
                $items = array();
                foreach($list as $item){
                    $items[] = array(
                        'name' => $item['name'],
                        'amount' => $item['qt'],
                        'value' => ($item['price'] * 100)
                    );
                }
                
                $metadata = array(
                     'custom_id' => $id_purchase,
                     'notification_url' => BASE_URL.'boleto/notificacao'
                    
                );
                
                 $shipping = array(
                     array(
                     'name' => 'FRETE',
                     'value' => ($frete * 100)
                    )
                );
                 
                 $body = array(
                     'metadata' => $metadata,
                     'items' => $items,
                     'shippings' => $shipping                   
                );
                 
                 try{
                     
                     $api = new \Gerencianet\Gerencianet($options);
                     $charge = $api>createCharge(array(), body);
                     
                     if($charge['code'] == '200'){
                         $charge_id = $charge['data']['charge_id'];
                         
                         $params = array(
                             'id' => $charge_id
                         );
                         
                         $customer = array(
                             'name' => $name,
                             'cpf' => $cpf,
                             'phone_number' => $telefone
                         );
                         
                         $bankingBillet = array(
                             'expire_at' => date('y-m-d', strtotime('+4 days'))
                         );
                         
                         $payment = array(
                             'banking_billet' => $bankingBillet
                         );
                         
                         $body = array(
                             'payment' => $payment
                         );
                         
                         try{
                             
                             $charge = $api->payCharge($params, $body);
                             
                             if($charge['code'] == '200'){
                                 
                                 $link = $charge['data']['link'];
                                 
                                 $purchases->updateBilletUrl($id_purchase, $link);
                                 
                                 unset($_SESSION['cart']);
                                 
                                 header("Location: ".$link);
                                 exit;
                             }
                             
                         } catch (Exception $e) {
                             echo "ERRO: ";
                             print_r($e->getMessage());
                             exit();
                         }
                     }
                 } catch (Exception $e) {
                     echo "ERRO: ";
                     print_r($e->getMessage());
                     exit();

                 }
            }
        }

        $this->loadTemplate('cart_boleto', $dados);
    }
    
    public function notificacao(){
        
         global $config;
                
                $options = array(
                    'client_id' => $config['gerencianet_Clientid'],
                    'client_secret' => $config['gerencianet_clientsecret'],
                    'sandbox' => $config['gerencianet_sandbox']
                );
                
                $token = $_POST['notification'];
                
                $params = array(
                    'token' => $token
                );
                
                try {
                    
                    $api = new \Gerencianet\Gerencianet($options);
                    $c = $api>getNotification($params, array());
                    
                    $ultimo = end($c['data']);
                    
                    $custom_id = $ultimo['custom_id'];
                    
                    $status = $ultimo['status']['current'];
                    
                    if($status == 'paid'){
                        
                        $purchases = new Purchases();
                        $purchases->setPaid($custom_id);
                    }
                                       
                } catch (Exception $e) {
                    echo "ERRO: ";
                    print_r($e->getMessage());
                    exit();
                }
        
    }

}
