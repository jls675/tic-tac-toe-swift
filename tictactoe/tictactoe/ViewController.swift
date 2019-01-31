//
//  ViewController.swift
//  tictactoe
//
//  Created by Jorge Sanchez on 1/7/19.
//  Copyright © 2019 Jorge Sanchez. All rights reserved.
//

/* import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    let soundArray = ["finisher", "fight", "fatality"]
    var audioPlayer: AVAudioPlayer!
    var currentPlayer: Int = 1
    var gameStatus = [false, false, false, false, false, false, false, false, false]
    
    @IBOutlet weak var place1: UIImageView!
    @IBOutlet weak var place2: UIImageView!
    @IBOutlet weak var place3: UIImageView!
    @IBOutlet weak var place4: UIImageView!
    @IBOutlet weak var place5: UIImageView!
    @IBOutlet weak var place6: UIImageView!
    @IBOutlet weak var place7: UIImageView!
    @IBOutlet weak var place8: UIImageView!
    @IBOutlet weak var place9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let index = sender.tag - 1
        
        if gameStatus[index] == false {
            
            changePic(i: index)
            playSound()
            gameStatus[index] = true
            
        }
        
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        
        currentPlayer = 1
        gameStatus = [false, false, false, false, false, false, false, false, false]
        
        place1.image = nil
        place2.image = nil
        place3.image = nil
        place4.image = nil
        place5.image = nil
        place6.image = nil
        place7.image = nil
        place8.image = nil
        place9.image = nil
        
    }
    
    func playSound(){
        
        let soundURL = Bundle.main.url(forResource: soundArray[Int.random(in: 0...2)], withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        
    }
    
    func picToUse() -> String {
        if currentPlayer == 1 {
            currentPlayer += 1
            return "circle"
        }
        else {
            currentPlayer -= 1
            return "cross"
        }
    }
    
    func changePic(i: Int) {
        if i == 0 {
            place1.image = UIImage(named: picToUse())
        }
        else if i == 1 {
            place2.image = UIImage(named: picToUse())
        }
        else if i == 2 {
            place3.image = UIImage(named: picToUse())
        }
        else if i == 3 {
            place4.image = UIImage(named: picToUse())
        }
        else if i == 4 {
            place5.image = UIImage(named: picToUse())
        }
        else if i == 5 {
            place6.image = UIImage(named: picToUse())
        }
        else if i == 6 {
            place7.image = UIImage(named: picToUse())
        }
        else if i == 7 {
            place8.image = UIImage(named: picToUse())
        }
        else {
            place9.image = UIImage(named: picToUse())
        }
    }
    
}/*

