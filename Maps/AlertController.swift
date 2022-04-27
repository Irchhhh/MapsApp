//
//  AlertController.swift
//  Maps
//
//  Created by Ирина on 26.04.2022.
//

import Foundation
import UIKit

extension MapViewController {
    
    func alertAddAddress(title: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = placeholder
        }
        
        let alertOkAction = UIAlertAction(title: "OK", style: .default) { okAction in
            let textFieldText = alertController.textFields?.first
            guard let text = textFieldText?.text else { return }
            completionHandler(text)
        }
        
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .cancel) { cancelAction in
            print(cancelAction)
        }
        
        alertController.addAction(alertOkAction)
        alertController.addAction(alertCancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func errorAlert(title: String, message: String) {
        
        let alertErrorController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okErrorAction = UIAlertAction(title: "OK", style: .default)
        
        alertErrorController.addAction(okErrorAction)
        present(alertErrorController, animated: true, completion: nil)
    }
}
