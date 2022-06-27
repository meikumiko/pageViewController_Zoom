//
//  extension.swift
//  pageViewController_Zoom
//
//  Created by Hsiao-Han Chi on 2022/6/23.
//

import Foundation
import UIKit

extension pageViewController: UIPageViewControllerDataSource{
    //往前翻頁
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //取得當前的頁數
        let currentPageIndex = viewcontrollerList.firstIndex(of: viewController)!
        //如果頁等於0，表示當前已經是第一頁，往前翻不產生動作
        if currentPageIndex == 0{
            return nil
        //如果頁數不等於0，往前翻顯示前一個子畫面
        }else{
            return viewcontrollerList[currentPageIndex - 1]
        }
    }

    //往後翻頁
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //取得當前的頁數
        let currentPageIndex = viewcontrollerList.firstIndex(of: viewController)!
        //如果頁數等於Array中view controller數量-1，表示當前已經是最後一頁，往後翻不產生動作
        if currentPageIndex == viewcontrollerList.count - 1{
            return nil
        //如果還不是最後一頁，往後翻顯示下一個子畫面
        }else{
            return viewcontrollerList[currentPageIndex + 1]
        }
    }
    
}


extension pageViewController: UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        //讀取當前的子畫面
        let currentPageViewController = (viewControllers?.first)!
        //讀取當前的頁數
        let currentIndex = viewcontrollerList.firstIndex(of: currentPageViewController)!
        //儲存當前頁數到用來傳遞資料的pageIndex中
        pageViewControllerDelegate?.pageIndex(index: currentIndex)
        
    }
}
 

extension ViewController: pageViewControllerDelegate{
    //設定總頁數
    func numberOfPage(numberOfPage: Int) {
        pageControl.numberOfPages = numberOfPage
    }
    
    //設定當前頁數
    func pageIndex(index: Int) {
        pageControl.currentPage = index
    }
}



extension firstVC: UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}

extension secVC: UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}

extension thirdVC: UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}

extension fourthVC: UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}

extension fifthVC: UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}

extension sixthVC: UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}
