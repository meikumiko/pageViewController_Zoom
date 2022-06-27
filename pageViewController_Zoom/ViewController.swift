//
//  ViewController.swift
//  pageViewController_Zoom
//
//  Created by Hsiao-Han Chi on 2022/6/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    
    var pageViewController: pageViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.backgroundStyle = .prominent
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //獲取pageViewController回傳的實例
        if let destinationPageViewController = segue.destination as? pageViewController{
            pageViewController = destinationPageViewController
            //代理自定義的pageViewControllerDelegate
            pageViewController.pageViewControllerDelegate = self
            
        }
    }


    @IBAction func changePage(_ sender: UIPageControl) {
        //讀取點選Page Control後，sender回傳的頁數
        let currentPageIndex = sender.currentPage
        //將讀取到的頁數套到剛剛定義的function中執行
        pageViewController.goToPage(index: currentPageIndex)
        
    }

}

