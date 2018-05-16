//
//  CursosViewController.swift
//  SegundaPracticaIOS
//
//  Created by MAC09 on 30/04/18.
//  Copyright © 2018 Gabtim. All rights reserved.
//

import UIKit

class CursosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var curso: UITableView!
    var cursos:[Cursos] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        curso.dataSource = self
        curso.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        curso.reloadData()
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
        cell.textLabel?.text = curso.nombre_curso
        return cell

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CursoSeleccionadoSegue" {
            let siguienteVC = segue.destination as! DetalleCursoViewController
            siguienteVC.curso = sender as? Cursos
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "CursoSeleccionadoSegue", sender: curso)
        
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let curso:Cursos? = cursos[indexPath.row]
        if editingStyle == .delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(curso!)
            cursos.remove(at: indexPath.row)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            tableView.reloadData()
        } else if editingStyle == .insert {
        }
    }
    
    


}
