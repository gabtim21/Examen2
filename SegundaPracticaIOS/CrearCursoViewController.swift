//
//  CrearCursoViewController.swift
//  SegundaPracticaIOS
//
//  Created by MAC09 on 30/04/18.
//  Copyright © 2018 Gabtim. All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {

    @IBOutlet weak var nombreCurso: UITextField!
    @IBOutlet weak var primeraNota: UITextField!
    @IBOutlet weak var segundaNota: UITextField!
    @IBOutlet weak var terceraNota: UITextField!
    @IBOutlet weak var cuartaNota: UITextField!
    @IBOutlet weak var promedioLabs: UITextField!
    @IBOutlet weak var examenFinal: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func agregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curso = Cursos(context: context)
        curso.nombre_curso = nombreCurso.text!
        curso.primer_nota = Double(primeraNota.text!)!
        curso.segunda_nota = Double(segundaNota.text!)!
        curso.tercera_nota = Double(terceraNota.text!)!
        curso.cuarta_nota = Double(cuartaNota.text!)!
        curso.promedio_lab = Double(promedioLabs.text!)!
        curso.examen_final = Double(examenFinal.text!)!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }

}
