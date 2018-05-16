//
//  ViewController.swift
//  SegundaPracticaIOS
//
//  Created by MAC09 on 30/04/18.
//  Copyright © 2018 Gabtim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usuarioText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var usuario:String = "Gabtim"
    var password:String = "123"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ingresarBoton(_ sender: Any) {
        if usuarioText.text == "Gabtim" && passwordText.text == "123" {
            performSegue(withIdentifier: "primerSegue", sender: nil)
            
        }else{
            
        }

    }

}

