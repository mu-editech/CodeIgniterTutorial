<?php
/**
* Class News
*/
class News extends CI_Controller
{

    /**
    * News constructor.
    */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('news_model');
        $this->load->helper('url_helper');
    }

    /**
    * index (一覧ページの表示)
    */
    public function index()
    {
        $data = [];
        $data['news'] = $this->news_model->get_news();
        $data['title'] = 'News archive';
        $this->load->view('templates/header', $data);
        $this->load->view('news/index', $data);
        $this->load->view('templates/footer');

    }

    /**
    * newsの主催ページの表示
    * @param null $slug
    */
    public function view($slug = null)
    {
        $data = [];
        $data['news_item'] = $this->news_model->get_news($slug);

        if (empty($data['news_item']))
        {
            show_404();
        }

        $data['title'] = $data['news_item']['title'];
        $this->load->view('templates/header', $data);
        $this->load->view('news/view', $data);
        $this->load->view('templates/footer');
    }
}
