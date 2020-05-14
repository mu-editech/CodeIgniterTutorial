<?php

/**
* Class News_model
*/
class News_model extends CI_Model {

    /**
    * News_model constructor.
    */
    public function __construct()
    {
        parent::__construct();
        //データベースへの接続
        $this->load->database();
    }

    /**
    * ニュースの取得
    * @param bool $slug
    * @return mixed
    */
    public function get_news($slug = FALSE)
    {
        if ($slug === FALSE)
        {
            $query = $this->db->get('news');
            return $query->result_array();
        }

        $query = $this->db->get_where('news', array('slug' => $slug));
        return $query->row_array();
    }
}