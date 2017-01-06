//
//  ViewController.swift
//  Silly Song
//
//  Created by 政达 何 on 2017/1/6.
//  Copyright © 2017年 heheda. All rights reserved.
//

import UIKit
func shortNameFromName(name: String) -> String {
    // implementation here
    let result = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    if let firstVowelRange = result.rangeOfCharacter(from: vowelSet) {
        return result.substring(from: firstVowelRange.lowerBound)
    }
    return result
}
func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortname = shortNameFromName(name: fullName)
    return lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortname)
}
let lyricsTemplate = "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>\n" +
    "Banana Fana Fo F<SHORT_NAME>\n" +
    "Me My Mo M<SHORT_NAME>\n" +
"<FULL_NAME>"
class ViewController: UIViewController {

    @IBOutlet weak var lyricsView: UITextView!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyricsForName(lyricsTemplate: lyricsTemplate, fullName: nameField.text!)
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

