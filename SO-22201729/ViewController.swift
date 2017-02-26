//
//  ViewController.swift
//  SO-22201729
//
//  Copyright © 2017 Xavier Schott
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var rearScrollView: UIScrollView!
    @IBOutlet weak var foreScrolView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    let foreImg = UIImageView.init(image: UIImage(named: "fore"))
    foreImg.frame = CGRect(x: 0, y: 0, width: foreImg.frame.width, height: foreScrolView.bounds.height)
    foreScrolView.contentSize = foreImg.frame.size
    foreScrolView.addSubview(foreImg)

    let rearImg = UIImageView.init(image: UIImage(named: "rear"))
    rearImg.frame = CGRect(x: 0, y: 0, width: rearImg.frame.width, height: rearScrollView.bounds.height)
    rearScrollView.contentSize = rearImg.frame.size
    rearScrollView.addSubview(rearImg)
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let foreSpan = foreScrolView.bounds.width - foreScrolView.contentSize.width
        let foreRatio = scrollView.contentOffset.x / foreSpan
        let rearSpan = rearScrollView.bounds.width - rearScrollView.contentSize.width
        rearScrollView.setContentOffset(
            CGPoint(x: foreRatio * rearSpan, y: 0),
            animated: false)
    }
}

