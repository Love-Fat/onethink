<?php

namespace Admin\Controller;
class TransactionController extends ThinkController {
    /*单页列表*/
    public function banners($p = 1){
        parent::lists('Banner', $p);
    }
    /**/
}