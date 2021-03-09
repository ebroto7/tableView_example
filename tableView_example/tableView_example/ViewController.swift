//
//  ViewController.swift
//  tableView_example
//
//  Created by Enric Broto Hernandez on 8/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    let reuseIndetifier = "reuseIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    let numberOfSections = 3
    let numberOfRowsInSection = 10
    let heightForHeaderInSection: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CellTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: reuseIndetifier)
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       per veure el número de indexPath
        let indexPath = indexPath
        print("has clicat la fila: \(indexPath)")
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return numberOfRowsInSection
        switch section {
        case 0: return 5
        case 1: return 10
        case 2: return 2
        default: return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndetifier, for: indexPath)
        if let picturesCell = cell as? CellTableViewCell {
           picturesCell.numberCell.text = String(indexPath.row)
            return picturesCell
        } else {
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "My Section header"
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         switch section {
         case 0: return "Section 1"
         case 1: return "Section 2"
         case 2: return "section 3"
         default: return nil
         }
    }
 
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeaderInSection
    }
    
    
}

