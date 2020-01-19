//
//  ViewController.swift
//  SlotMachine
//
//  Created by MacUser on 2020-01-18.
//  Copyright © 2020 MacUser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerMoney = 1000;
    var winnings = 0;
    var jackpot = 5000;
    var turn = 0;
    var playerBet = 0;
    var winNumber = 0;
    var lossNumber = 0;
    var spinResult: [String] = [""];
    var fruits = "";
    var winRatio: Float = 0;
    var grapes = 0;
    var bananas = 0;
    var oranges = 0;
    var cherries = 0;
    var bars = 0;
    var bells = 0;
    var sevens = 0;
    var blanks = 0;
    
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        resultText.backgroundColor = UIColor(patternImage: UIImage(named: "orange")!)
        // Do any additional setup after loading the view.
    }

    /* Utility function to show Player Stats */
    public func showPlayerStats()
    {
        print("winNumber "+String(winNumber));
        print("turn "+String(turn));
        winRatio = Float((winNumber * 100) / turn);
        print("winRatio "+String(winRatio));
//        jackPotText.text = String(jackpot);
//        playerMoneyText.text = String(playerMoney);
//        turnText.text = String(turn);
//        winsText.text = String(winNumber);
//        lossesText.text = String(lossNumber);
//        winRatioText.text = String(winRatio) + "%";
    }

    /* Utility function to reset all fruit tallies */
    public func resetFruitTally() {
        grapes = 0;
        bananas = 0;
        oranges = 0;
        cherries = 0;
        bars = 0;
        bells = 0;
        sevens = 0;
        blanks = 0;
    }
    
    /* Utility function to reset the player stats */
    public func resetAll() {
        playerMoney = 1000;
        winnings = 0;
        jackpot = 5000;
        turn = 0;
        playerBet = 0;
        winNumber = 0;
        lossNumber = 0;
        winRatio = 0;
    }
    
    /* Check to see if the player won the jackpot */
    public func checkJackPot() {
        /* compare two random values
         var jackPotTry = Math.floor(Math.random() * 51 + 1);
         var jackPotWin = Math.floor(Math.random() * 51 + 1);
         if (jackPotTry == jackPotWin) {
         alert("You Won the $" + jackpot + " Jackpot!!");
         playerMoney += jackpot;*/
        jackpot = 1000;
    }
    
    /* Utility function to show a win message and increase player money */
    public func showWinMessage() {
        playerMoney += winnings;
//        resultText.text = "You Won: $" + String(winnings);
        resetFruitTally();
        //checkJackPot();
    }
    
    /* Utility function to show a loss message and reduce player money */
    public func showLossMessage() {
        playerMoney -= playerBet;
//        resultText.text = "You Lost!";
        resetFruitTally();
    }
    
    /* Utility function to check if a value falls within a range of bounds */
    public func checkRange(value:Int, lowerBounds:Int, upperBounds:Int) ->Int{
        if (value >= lowerBounds && value <= upperBounds)
        {
            return value;
        }
        else {
            return 0;
        }
    }
    
    /* When this function is called it determines the betLine results.
     e.g. Bar - Orange - Banana */
    public func Reels() -> Array<String> {
        var betLine = [" ", " ", " "];
        var outCome = [0, 0, 0];
        
        for spin in (0..<3)  {
            outCome[spin] = Int.random(in: 1..<65);
            print(outCome[spin]);
            switch (outCome[spin]) {
            case checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):  // 41.5% probability
                betLine[spin] = "blank";
                blanks += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37): // 15.4% probability
                betLine[spin] = "Grapes";
                grapes += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46): // 13.8% probability
                betLine[spin] = "Banana";
                bananas += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54): // 12.3% probability
                betLine[spin] = "Orange";
                oranges += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59): //  7.7% probability
                betLine[spin] = "Cherry";
                cherries += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62): //  4.6% probability
                betLine[spin] = "Bar";
                bars += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64): //  3.1% probability
                betLine[spin] = "Bell";
                bells += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65): //  1.5% probability
                betLine[spin] = "Seven";
                sevens += 1;
                break;
            default:
                break;
            }
        }
        return betLine;
    }
    
    
    /* This function calculates the player's winnings, if any */
    public func determineWinnings() {
        if (blanks == 0)
        {
            if (grapes == 3) {
                winnings = playerBet * 10;
            }
            else if(bananas == 3) {
                winnings = playerBet * 20;
            }
            else if (oranges == 3) {
                winnings = playerBet * 30;
            }
            else if (cherries == 3) {
                winnings = playerBet * 40;
            }
            else if (bars == 3) {
                winnings = playerBet * 50;
            }
            else if (bells == 3) {
                winnings = playerBet * 75;
            }
            else if (sevens == 3) {
                winnings = playerBet * 100;
            }
            else if (grapes == 2) {
                winnings = playerBet * 2;
            }
            else if (bananas == 2) {
                winnings = playerBet * 2;
            }
            else if (oranges == 2) {
                winnings = playerBet * 3;
            }
            else if (cherries == 2) {
                winnings = playerBet * 4;
            }
            else if (bars == 2) {
                winnings = playerBet * 5;
            }
            else if (bells == 2) {
                winnings = playerBet * 10;
            }
            else if (sevens == 2) {
                winnings = playerBet * 20;
            }
            else if (sevens == 1) {
                winnings = playerBet * 5;
            }
            else {
                winnings = playerBet * 1;
            }
            winNumber += 1;
            showWinMessage();
        }
        else
        {
            lossNumber += 1;
            showLossMessage();
        }
    
    }
    
    @IBAction func spinButton(_ sender: Any) {
        spinResult = Reels();
        fruits = spinResult[0] + " - " + spinResult[1] + " - " + spinResult[2];
        
        self.imageView1.image = UIImage(named:spinResult[0])
        self.imageView2.image = UIImage(named:spinResult[1])
        self.imageView3.image = UIImage(named:spinResult[2])
        
        
        
        
//        resultComboText.text = fruits;
        determineWinnings();
        turn += 1;
        showPlayerStats();
    }
    
}

