//
//  ViewController.swift
//  Demo
//
//  Created by Tai on 2022/10/31.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var leftButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        leftButton.isEnabled = false
        
    }


    @IBAction func rightButtonAction(_ sender: UIButton) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
        if page <= 4 {
            scrollView.contentOffset.x = scrollView.bounds.width * CGFloat(page + 1)
            leftButton.isEnabled = true
        }
        
        if page == 3 {
            rightButton.isEnabled = false
        }
        
        pageSegmentedControlState(sender, page)
    }
    
    
    @IBAction func leftButtonAction(_ sender: UIButton) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
        if page >= 0 {
            scrollView.contentOffset.x = scrollView.bounds.width * CGFloat(page - 1)
            rightButton.isEnabled = true
        }
        
        if page == 1 {
            leftButton.isEnabled = false
        }
        
        pageSegmentedControlState(sender, page)
    }
    
    @IBAction func segmentedAction(_ sender: Any) {
        
        let page = segmentedControl.selectedSegmentIndex
        pageControl.currentPage = page
        
        if page == 0 {
            scrollView.contentOffset.x = 0
        } else if page == 1 {
            scrollView.contentOffset.x = scrollView.bounds.width * CGFloat(page)
        } else if page == 2 {
            scrollView.contentOffset.x = scrollView.bounds.width * CGFloat(page)
        } else if page == 3 {
            scrollView.contentOffset.x = scrollView.bounds.width * CGFloat(page)
        } else if page == 4 {
            scrollView.contentOffset.x = scrollView.bounds.width * CGFloat(page)
        }
        
        buttonState(page)
        
    }
    
    
    @IBAction func pageContrlAction(_ sender: Any) {
        
        let page = pageControl.currentPage
        segmentedControl.selectedSegmentIndex = page
        
        if page == 0 {
            scrollView.contentOffset.x = 0
        } else if page == 1 {
            scrollView.contentOffset.x = scrollView.bounds.width * CGFloat(page)
        } else if page == 2 {
            scrollView.contentOffset.x = scrollView.bounds.width * CGFloat(page)
        } else if page == 3 {
            scrollView.contentOffset.x = scrollView.bounds.width * CGFloat(page)
        } else if page == 4 {
            scrollView.contentOffset.x = scrollView.bounds.width * CGFloat(page)
        }
        
        buttonState(page)
    }
    
    func buttonState(_ ePage: Int) {
        if ePage == 0 {
            rightButton.isEnabled = true
            leftButton.isEnabled = false
        } else if ePage == 4 {
            rightButton.isEnabled = false
            leftButton.isEnabled = true
        } else {
            rightButton.isEnabled = true
            leftButton.isEnabled = true
        }
    }
    
    func pageSegmentedControlState(_ eSender: UIButton, _ ePage: Int) {
        
        if eSender.restorationIdentifier! == "right" {
            segmentedControl.selectedSegmentIndex = ePage + 1
            pageControl.currentPage = ePage + 1
        } else {
            segmentedControl.selectedSegmentIndex = ePage - 1
            pageControl.currentPage = ePage - 1
        }
    }
}



extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
        pageControl.currentPage = page
        segmentedControl.selectedSegmentIndex = page
        
        buttonState(page)
    }
}

