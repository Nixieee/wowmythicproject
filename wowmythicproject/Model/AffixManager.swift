//
//  AffixManager.swift
//  wowmythicproject
//
//  Created by Nikolay Kalchev on 6.04.21.
//  Copyright © 2021 Nikolay Kalchev. All rights reserved.
//

import Foundation

protocol AffixManagerDelegate {
    func didUpdateAffix(_ affixManager: AffixManager, affix: AffixModel)
    func didFailWithError(error: Error)
}
struct AffixManager {
let affixURL = "https://raider.io/api/v1/mythic-plus/affixes?region=eu"
var delegate : AffixManagerDelegate?
func performRequest() {
        if let url = URL(string: affixURL) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let affix = self.parseJSON(safeData) {
                        self.delegate?.didUpdateAffix(self, affix: affix)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    
    //Refactor everything
    func parseJSON(_ affixData: Data) -> AffixModel? {
        let decoder = JSONDecoder()
        do {
          let decodedData = try decoder.decode(AffixData.self, from: affixData)
            let firstname = decodedData.affix_details[0].name
            let secondname = decodedData.affix_details[1].name
            let thirdname = decodedData.affix_details[2].name
            let fourthname = decodedData.affix_details[3].name
            let affixes = [firstname,secondname,thirdname,fourthname]
            let affix = AffixModel(affixName: affixes)
            return affix
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
