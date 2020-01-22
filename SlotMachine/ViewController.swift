//
//  Source file name: ViewController.swift
//  Author’s name(s) : Loveleen Kaur (301093331)
//                     Bhavya Shah (301076681)
//                     Dipal Patel (301090880)
//  Date last Modified : 01 - 22 - 2020
//  Program description : Logic for the slot machine
//

import UIKit

class ViewController: UIViewController {
    
    // slot machine properties
    var playerMoney = 500;
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
    
    // array of images to shuffle
    let reelItems = [UIImage(named: "Lemon.png"),
    UIImage(named: "Grapes.png"),
    UIImage(named: "Banana.png"),
    UIImage(named: "Orange.png"),
    UIImage(named: "Cherry.png"),
    UIImage(named: "Bar.png"),
    UIImage(named: "Bell.png"),
    UIImage(named: "Seven.png")]
    
    @IBOutlet weak var playerAmount: UILabel!
    
    @IBOutlet weak var spinButton: UIButton!
    
    @IBOutlet weak var winCount: UILabel!
    
    @IBOutlet weak var lossCount: UILabel!
    
    @IBOutlet weak var betAmount: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
    
    //Actions on first bet amount : $ 5
    @IBAction func betAmount1(_ sender: Any) {
        if(playerMoney >= 5){
            betAmount.text = String(5)
        }
        else
        {
            self.resetMessage()
        }
    }
    
    //Actions on second bet amount : $ 10
    @IBAction func betAmount2(_ sender: Any) {
        if(playerMoney >= 10){
            betAmount.text = String(10)
        }
        else
        {
            self.resetMessage()
        }
    }
    
    //Actions on third bet amount : $ 50
    @IBAction func betAmount3(_ sender: Any) {
        if(playerMoney >= 50){
            betAmount.text = String(50)
        }
        else
        {
            self.resetMessage()
        }
    }
    
    //Actions on fourth bet amount : $ 100
    @IBAction func betAmount4(_ sender: Any) {
        if(playerMoney >= 100){
            betAmount.text = String(100)
        }
        else
        {
            self.resetMessage()
        }
    }

    /* Utility function to show Player Stats */
    public func showPlayerStats()
    {
        playerAmount.text = String(playerMoney);
        winCount.text = String(winNumber);
        lossCount.text = String(lossNumber);
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
        playerAmount.text = String(500)
        winCount.text = String(0)
        lossCount.text = String(0)
        betAmount.text = String(0)
        playerMoney = 500;
        winnings = 0;
        jackpot = 5000;
        playerBet = 0;
        winNumber = 0;
        lossNumber = 0;
        spinButton.isEnabled = true
    }
    
    /* Utility function to reset the player stats */
    @IBAction func resetAll(_ sender: Any) {
        playerAmount.text = String(500)
        winCount.text = String(0)
        lossCount.text = String(0)
        betAmount.text = String(0)
        playerMoney = 500;
        winnings = 0;
        jackpot = 5000;
        playerBet = 0;
        winNumber = 0;
        lossNumber = 0;
        spinButton.isEnabled = true
    }
    
    /* Check to see if the player won the jackpot */
    public func checkJackPot() {
        /* compare two random values */
        let jackPotTry = Int.random(in: 1..<50);
        let jackPotWin = Int.random(in: 1..<50);
        if (jackPotTry == jackPotWin) {
          //alert("You Won the $" + jackpot + " Jackpot!!");
          playerMoney += jackpot;
          jackpot = 1000;
        }
    }
    
    /* Utility function to show a win message and increase player money */
    public func showWinMessage() {
        playerMoney += winnings;
        if(playerMoney == 0){
            spinButton.isEnabled = false
        }
        resetFruitTally();
        checkJackPot();
    }
    
    /* Utility function to show a loss message and reduce player money */
    public func showLossMessage() {
        playerMoney -= playerBet;
        if(playerMoney == 0){
            spinButton.isEnabled = false
        }
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
                betLine[spin] = "0";
                blanks += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37): // 15.4% probability
                betLine[spin] = "1";
                grapes += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46): // 13.8% probability
                betLine[spin] = "2";
                bananas += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54): // 12.3% probability
                betLine[spin] = "3";
                oranges += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59): //  7.7% probability
                betLine[spin] = "4";
                cherries += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62): //  4.6% probability
                betLine[spin] = "5";
                bars += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64): //  3.1% probability
                betLine[spin] = "6";
                bells += 1;
                break;
            case checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65): //  1.5% probability
                betLine[spin] = "7";
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
    
    // perform the spin action on button click
    @IBAction func spinButton(_ sender: Any) {
        playerBet = Int(betAmount.text!) ?? 0;
        
        if (playerMoney == 0)
        {
            self.resetMessage()
        }
        else if (playerBet > playerMoney) {
            
          //  alert("You don't have enough Money to place that bet.");
            let dialogMessage = UIAlertController(title: "Confirm", message: "You don't have enough Money to place that bet.", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                 print("Ok button tapped")
                 
            })
            
            //Add OK and Cancel button to dialog message
            dialogMessage.addAction(ok)
            
            // Present dialog message to user
            self.present(dialogMessage, animated: true, completion: nil)
            
        }
        else if (playerBet != 0) {
            //playerBet <= playerMoney
            spinResult = Reels();
            fruits = spinResult[0] + " - " + spinResult[1] + " - " + spinResult[2];

            picker.selectRow(Int(spinResult[0]) ?? 0, inComponent: 0, animated: true)
            picker.selectRow(Int(spinResult[1]) ?? 0, inComponent: 1, animated: true)
            picker.selectRow(Int(spinResult[2]) ?? 0, inComponent: 2, animated: true)

            determineWinnings();
            turn += 1;
            showPlayerStats();
            
        }
        else {
        //  alert("You don't have enough Money to place that bet.");
                let dialogMessage = UIAlertController(title: "Select Bet Money", message: "Please enter the bet amount first.", preferredStyle: .alert)
                
                // Create OK button with action handler
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                     print("Ok button tapped")
                })
                
                //Add OK and Cancel button to dialog message
                dialogMessage.addAction(ok)
                
                // Present dialog message to user
                self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    /* Utility function to quit the game */
    @IBAction func quitGame(_ sender: Any) {
        let dialogMessage = UIAlertController(title: "Quit Game?", message: "Are you sure! you want to quit the game?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             exit(0);
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    /* Utility function for reset message */
    public func resetMessage(){
        let dialogMessage = UIAlertController(title: "Play Again?", message: "You ran out of Money! \nDo you want to play again?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
             self.resetAll()
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return reelItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let IV = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        IV.image = reelItems[row]
        return IV
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
}

// for button borderwidth , radius and bordercolor
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

