<?php





namespace Home\Controller;


class BookController extends HomeController {



	public function index()


	{


		 if(IS_POST){


		 	$Online = D('Online');


			$verify=$_POST['verify'];
			$findus=$_POST['findus'];
			$findus=implode(',',$findus);
			
            //数据验证


			

            if(!$Online->create()){

				
                $this->error($Online->getError());


            }                        
			$Online->findus = $findus;
			if(!check_verify($verify)){


				$this->error('Verification code input errors！');


			}
			
            if($Online->add()){


                $this->success('Feedback success!',U('Book/index'));


            }


		 


		 }else


		 {

			$id=$_GET['id'];
			if($id!='')
			{
				$Document = D('Document');
				$documentlist=$Document->field('id,title')->where("id=".$id)->find();
			}
			$this->assign('arc_title',$documentlist['title']);
		 	$this->display();


		 }


	}
	


	 public function verify(){


        $verify = new \Think\Verify(array('length'=>4));


        $verify->entry(1);


    }


}