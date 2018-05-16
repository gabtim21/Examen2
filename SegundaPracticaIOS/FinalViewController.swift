//
//  FinalViewController.swift
//  SegundaPracticaIOS
//
//  Created by MAC09 on 2/05/18.
//  Copyright © 2018 Gabtim. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var notasF: UITableView!
    @IBOutlet weak var cursoNombre: UILabel!
    var cursos:[Cursos] = []
    var notasLaboratorio:Double = 0
    var examenFinal:Double = 0
    var promedioFinal:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notasF.delegate = self
        notasF.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        notasF.reloadData()
    }
    
    func obtenerCursos() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(Cursos.fetchRequest())as! [Cursos]
        } catch{
            print("Ocurrio un error")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        var notas:[Double] = []
        notas.append(curso.primer_nota)
        notas.append(curso.segunda_nota)
        notas.append(curso.tercera_nota)
        notas.append(curso.cuarta_nota)
        notas.sort()
        notas.remove(at: 0)
        notasLaboratorio = curso.promedio_lab
        examenFinal = curso.examen_final
        
        promedioFinal = (((notas[0]+notas[1]+notas[2])/3)*0.3+(notasLaboratorio*0.6)+(examenFinal*0.1))
        if promedioFinal >= 13 {
            cell.textLabel?.text = curso.nombre_curso! + " = 😍\(promedioFinal)"
        }else{
            cell.textLabel?.text = curso.nombre_curso! + " = 😡\(promedioFinal)"
        }
        
        return cell
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
