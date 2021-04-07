//
//  ViewController.swift
//  wowmythicproject
//
//  Created by Nikolay Kalchev on 6.04.21.
//  Copyright © 2021 Nikolay Kalchev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var LabelOne: UILabel!
    
    @IBOutlet weak var LabelTwo: UILabel!
    @IBOutlet weak var LabelThree: UILabel!
    @IBOutlet weak var LabelFour: UILabel!
    var affixManager = AffixManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        affixManager.delegate = self
        affixManager.performRequest()
    }


}
//Mark: AffixManagerDelegate
extension ViewController: AffixManagerDelegate {
    func didUpdateAffix(_ affixManager: AffixManager, affix: AffixModel) {
        DispatchQueue.main.async {
            print(affix.affixName)
            self.LabelOne.text = affix.affixName[0]
            self.LabelTwo.text = affix.affixName[1]
            self.LabelThree.text = affix.affixName[2]
            self.LabelFour.text = affix.affixName[3]
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
