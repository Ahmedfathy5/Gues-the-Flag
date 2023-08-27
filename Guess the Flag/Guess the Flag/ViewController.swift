//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Ahmed Fathi on 17/08/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button3: UIButton!
    var countries = [String]()
    var scores = 0
    var correctAnswer = 0
     
    override func viewDidLoad() {
        super.viewDidLoad()
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        
        
        
        
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        Button1.layer.cornerRadius = 5
        
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
        
    }
    func askQuestion(action: UIAlertAction! ){
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func ButtonTapped(_ sender: UIButton) {
        var title: String = ""
        if sender.tag == correctAnswer {
            title = "correct"
            scores += 1
            
        } else{
            title = "wrong"
            scores -= 1
        }
        let alret = UIAlertController(title: title, message: "Your score is \(scores)", preferredStyle: .alert)
        alret.addAction(UIAlertAction(title: "Continue", style: .default , handler: askQuestion))
        present(alret, animated: true)
    }
    
    
    
}

