//
//  ViewController.swift
//  Edicion
//
//  Created by Alumno on 10/28/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import UIKit

var contactos : [Contacto] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    @IBOutlet weak var tvContactos: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda =  tableView.dequeueReusableCell(withIdentifier: "CeldaContacto") as!
        CeldaContactoController
        
        celda.lblNombre.text = contactos[indexPath.row].nombre
        celda.lblCelular.text = contactos[indexPath.row].celular
        celda.lblCorreo.text = contactos[indexPath.row].correo
        
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        let contactoSeleccionado = contactos[tvContactos.indexPathForSelectedRow!.row]
        let destino = segue.destination as! EditarContactoController
        destino.contacto = contactoSeleccionado
        destino.callbackActualizarTVContactos = actualizarTVContactos
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        contactos.append(Contacto(nombre:"Pedro", celular: "23423", correo:"asdf@hotmail.com"))
        contactos.append(Contacto(nombre:"Juan", celular: "26583", correo:"juan@hotmail.com"))
        contactos.append(Contacto(nombre:"Ramiro", celular: "12234", correo:"ramiro@hotmail.com"))
    }
    
    func actualizarTVContactos() {
        tvContactos.reloadData()
    }

}

