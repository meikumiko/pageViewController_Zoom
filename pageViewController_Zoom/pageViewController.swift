//
//  pageViewController.swift
//  pageViewController_Zoom
//
//  Created by Hsiao-Han Chi on 2022/6/23.
//

import UIKit

protocol pageViewControllerDelegate: AnyObject{
    
    func numberOfPage(numberOfPage: Int) //總頁數
    func pageIndex(index: Int) //當前頁數
}



class pageViewController: UIPageViewController {
    
    var viewcontrollerList = [UIViewController]()
    weak var pageViewControllerDelegate: pageViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //生成子畫面加到Array中
        viewcontrollerList.append(getViewController(withStoryboardID: "firstVC"))
        viewcontrollerList.append(getViewController(withStoryboardID: "secVC"))
        viewcontrollerList.append(getViewController(withStoryboardID: "thirdVC"))
        viewcontrollerList.append(getViewController(withStoryboardID: "fourthVC"))
        viewcontrollerList.append(getViewController(withStoryboardID: "fifthVC"))
        viewcontrollerList.append(getViewController(withStoryboardID: "sixthVC"))

        //設定首頁
        setViewControllers([viewcontrollerList[0]], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
        self.delegate = self
        
        pageViewControllerDelegate?.numberOfPage(numberOfPage: viewcontrollerList.count)
        // Do any additional setup after loading the view.
    }
    
    //宣告透過Storyboard ID取得子畫面View Controller的function
    func getViewController(withStoryboardID storyboardID: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyboardID)
    }

    func goToPage(index: Int) {
        //讀取當前頁面
        let currentViewController = viewControllers!.first!
        //讀取當前頁數
        let currentViewControllerIndex = viewcontrollerList.firstIndex(of: currentViewController)!
        //如果點選Page Control所得到的index值大於當前頁數的值，代表應該繼續往後翻
        if index > currentViewControllerIndex{
            setViewControllers([viewcontrollerList[index]], direction: .forward, animated: true, completion: nil)
        //如果點選Page Control所得到的index值小於當前頁數的值，代表應該往前翻
        }else if index < currentViewControllerIndex{
            setViewControllers([viewcontrollerList[index]], direction: .reverse, animated: true, completion: nil)
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
