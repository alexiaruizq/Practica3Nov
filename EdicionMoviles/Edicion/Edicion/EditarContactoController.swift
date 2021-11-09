//
//  EditarContactoController.swift
//  Edicion
//
//  Created by Alumno on 02/11/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import Foundation
import UIKit

class EditarContactoController : UIViewController {
    var contacto : Contacto?
    var callbackActualizarTVContactos : (() -> Void)?
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtCelular: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    
    override func viewDidLoad() {
        self.title = "Editar Contacto"
        
        txtNombre.text = contacto!.nombre
        txtCelular.text = contacto!.celular
        txtCorreo.text = contacto!.correo
    }
    @IBAction func doTapGuardar(_ sender: Any) {
        contacto!.nombre = txtNombre.text!
        contacto!.celular = txtCelular.text!
        contacto!.correo = txtCorreo.text!
        
        callbackActualizarTVContactos!()
    }
}
