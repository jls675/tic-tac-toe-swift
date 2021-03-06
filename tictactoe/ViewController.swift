//
//  ViewController.swift
//  tictactoe
//
//  Updated by Jorge Sanchez on 1/25/19.
//  Copyright © 2019 Jorge Sanchez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    let soundArray = ["finisher", "fight", "fatality"]
    var audioPlayer: AVAudioPlayer!
    var currentPlayer: Int = 1
    var nPC: Bool = false
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet var buttonList: [UIButton]!//array contains all buttons
    
    @IBOutlet var instanceList: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetButton.isHidden = true
        backgroundImage.image = nil
        disableMoveButtons()
    }
    
    
    @IBAction func instanceButton(_ sender: UIButton) {
        backgroundImage.image = UIImage(named: "lines")
        if sender.tag == 11 {
            nPC = true
        }
        for instance in instanceList {
            instance.isHidden = true
        }
        enableMoveButtons()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if buttonList[sender.tag - 1].isEnabled == true {
            buttonList[sender.tag - 1].isEnabled = false
            let index = sender.tag - 1
            if nPC == true {
                changeImagePlayer(n: index)
                changeImageNPC()
            }
            else {
                changeImagePlayer(n: index)
            }
            playSound()
        }
        
        let isWin: Bool = checkWin()
        
        if  isWin == true && nPC == true {
            showUIALERT(t: "YOU WON", m: "You are smarter than an NPC")
            
        }
        else if isWin == true {
            showUIALERT(t: "YOU WON", m: "You are smarter than your Friend")
        }
        else {
            checkDRAW()
        }
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        
    }
    
    func checkWin()-> Bool {
        
        return ((buttonList[0].title(for: .normal) != nil && buttonList[0].title(for: .normal) == buttonList[1].title(for: .normal) && buttonList[2].title(for: .normal) == buttonList[0].title(for: .normal)) || (buttonList[3].title(for: .normal) != nil && buttonList[3].title(for: .normal) == buttonList[4].title(for: .normal) && buttonList[5].title(for: .normal) == buttonList[3].title(for: .normal)) || (buttonList[6].title(for: .normal) != nil && buttonList[6].title(for: .normal) == buttonList[7].title(for: .normal) && buttonList[8].title(for: .normal) == buttonList[6].title(for: .normal)) || (buttonList[0].title(for: .normal) != nil && buttonList[0].title(for: .normal) == buttonList[3].title(for: .normal) && buttonList[6].title(for: .normal) == buttonList[0].title(for: .normal)) || (buttonList[1].title(for: .normal) != nil && buttonList[1].title(for: .normal) == buttonList[4].title(for: .normal) && buttonList[7].title(for: .normal) == buttonList[1].title(for: .normal)) || (buttonList[2].title(for: .normal) != nil && buttonList[2].title(for: .normal) == buttonList[5].title(for: .normal) && buttonList[8].title(for: .normal) == buttonList[2].title(for: .normal)) || (buttonList[0].title(for: .normal) != nil && buttonList[0].title(for: .normal) == buttonList[4].title(for: .normal) && buttonList[8].title(for: .normal) == buttonList[0].title(for: .normal)) || (buttonList[2].title(for: .normal) != nil && buttonList[2].title(for: .normal) == buttonList[4].title(for: .normal) && buttonList[6].title(for: .normal) == buttonList[2].title(for: .normal)))
        
    }
    
    func checkDRAW() {
        var buttonsPRESSED = 0
        for button in buttonList where button.isEnabled == false {
            buttonsPRESSED += 1
        }
        if buttonList.count == buttonsPRESSED {
            showUIALERT(t: "DRAW", m: "ohhhh noooo, how could this happen?")
        }
    }
    
    func showUIALERT(t: String, m: String) {
        let alert = UIAlertController(title: t, message: m, preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            self.restart()
        }
        
        alert.addAction(restartAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func restart() {
        disableMoveButtons()
        for button in instanceList {
            button.isHidden = false
        }
        backgroundImage.image = nil
        currentPlayer = 1
        nPC = false
        for button in buttonList {
            button.setTitle(nil, for: .normal)
        }
    }
    
    func playSound() {
        
        let soundURL = Bundle.main.url(forResource: soundArray[Int.random(in: 0...2)], withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        
    }
    
    func symbolToUse() -> String {
        if currentPlayer == 1 {
            currentPlayer += 1
            return "O"
        }
        else {
            currentPlayer -= 1
            return "X"
        }
    }
    
    func changeImagePlayer(n: Int) {
        buttonList[n].setTitle(symbolToUse(), for: .normal)
    }
    
    func changeImageNPC() {
        var tempArray = [Int]()
        for button in buttonList where button.isEnabled == true {
            tempArray.append(button.tag - 1)
        }
        if tempArray.count - 1 >= 0 {
            let randomN = tempArray[Int.random(in: 0...tempArray.count - 1)]
            buttonList[randomN].setTitle(symbolToUse(), for: .normal)
            buttonList[randomN].isEnabled = false
        }
    }
    
    func disableMoveButtons() {
        for button in buttonList {
            button.isEnabled = false
        }
    }
    func enableMoveButtons() {
        for button in buttonList where button.isEnabled == false {
            button.isEnabled = true
        }
    }
    
}
