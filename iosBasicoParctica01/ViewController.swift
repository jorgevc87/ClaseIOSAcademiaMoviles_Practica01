import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var NameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
    }

    @IBAction func validar(_ sender: Any) {
        let email = NameTextfield.text!
        let pass = passwordTextField.text!
        
        if email.count == 0 {
            showALert(message: "Debes ingresar tu correo")
            return
        }
        
        if pass.count == 0 {
            showALert(message: "Debes ingresar tu contrasenia")
            return
        }
        
        if !(email.isValidEmail()) {
            showALert(message: "El email no es válido, Vuelve a ingresar tu email")
            return
        }
        
        if !(email == "ejemplo@dominio.com") || !(pass == "12345") {
            showALert(message: "Su usuario o clave no coinciden")
            return
        }
        
        showALert(message: "Gracias por ingresar al sistema con el correo\n\(email)")
    }
    
    private func showALert(message : String){
        let alert = UIAlertController(title: "Form", message: message, preferredStyle: .alert)
        
        //AGREGANDO UN BOTON AL ALERT (ACTION)
        let btnContinuar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        
        alert.addAction(btnContinuar)
        
        self.present(alert, animated: true, completion: nil)
    }
}


 extension String {
 func isValidEmail() -> Bool {
 // here, `try!` will always succeed because the pattern is valid
 let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
 return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
 }
 }
