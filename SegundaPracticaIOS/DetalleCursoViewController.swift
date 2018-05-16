//
//  DetalleCursoViewController.swift
//  SegundaPracticaIOS
//
//  Created by MAC09 on 30/04/18.
//  Copyright © 2018 Gabtim. All rights reserved.
//

import UIKit

class DetalleCursoViewController: UIViewController {
    var curso:Cursos?  = nil
    
    
    @IBOutlet weak var primerN: UITextField!
    @IBOutlet weak var segundoN: UITextField!
    @IBOutlet weak var cuartaN: UITextField!
    @IBOutlet weak var promedioL: UITextField!
    @IBOutlet weak var examenF: UITextField!
    @IBOutlet weak var cursoLabel: UILabel!
    @IBOutlet weak var terceraN: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if curso != nil {
        cursoLabel.text = curso!.nombre_curso
        primerN.text = String(curso!.primer_nota)
        segundoN.text = String(curso!.segunda_nota)
        terceraN.text = String(curso!.tercera_nota)
        cuartaN.text = String(curso!.cuarta_nota)
        promedioL.text = String(curso!.promedio_lab)
        examenF.text = String(curso!.examen_final)
        }
    }

    @IBAction func actualizarCurso(_ sender: Any) {
        
        if curso != nil {
        curso?.nombre_curso = cursoLabel.text!
        curso?.primer_nota = Double(primerN.text!)!
        curso?.segunda_nota = Double(segundoN.text!)!
        curso?.tercera_nota = Double(terceraN.text!)!
        curso?.cuarta_nota = Double(cuartaN.text!)!
        curso?.promedio_lab = Double(promedioL.text!)!
        curso?.examen_final = Double(examenF.text!)!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        }
    }

}
