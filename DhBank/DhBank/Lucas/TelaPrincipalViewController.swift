//
//  TelaPrincipalViewController.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit


class TelaPrincipalViewController: UIViewController, SelectedRecipeCollectionViewModelCallBack {
        
    // Protocols:
    
    func acaoViewSelecionarViewCurtidas(imagemCurtidas: UIImageView, viewSelecionada: Bool, indexView: Int) {
        listViewLikesSelecionados[indexView] = viewSelecionada
        
        imagemCurtidas.image = UIImage(systemName: "heart.fill")
        imagemCurtidas.tintColor = .red
    }
    
    func acaoViewDeselecionarViewCurtidas(imagemCurtidas: UIImageView, viewSelecionada: Bool, indexView: Int) {
        listViewLikesSelecionados[indexView] = viewSelecionada
        
        imagemCurtidas.image = UIImage(systemName: "heart")
        imagemCurtidas.tintColor = .lightGray
    }
        
    var listViewLikesSelecionados = [Bool]()
    var listStringFilteredTags = [String]()
    var listTags = [Bool]()
    
    func initialize(listaBoolTags: [Bool]) {
        self.listTags = listaBoolTags
    }
    
    @IBOutlet weak var searchBarPesquisar: UISearchBar!
    
    @IBAction func botaoVoltar(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func botaoSalvos(_ sender: Any) {
//        performSegue(withIdentifier: "segueSelectedFilterToSalvos", sender: nil)
        print("clicou no botao salvos")
    }
    
    @IBAction func botaoCurtidas(_ sender: Any) {
//        performSegue(withIdentifier: "segueSelectedFilterToCurtidas", sender: nil)
        print("clicou no botao curtidas")
    }
    
    @IBOutlet weak var collectionViewReceitas: UICollectionView!
    @IBOutlet weak var textField : UITextField!
    
    let dataSource = SelectedFilterRecipesDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        setupCellsCollectionView()
        self.addDoneButtonOnKeyboard()
    }
    
    
    // adiciona botão(converter) na barra superior do teclado
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Converter", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.doneButtonAction))

        let items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)

        doneToolbar.items = items as? [UIBarButtonItem]
        doneToolbar.sizeToFit()

        self.textField.inputAccessoryView = doneToolbar
        self.textField.inputAccessoryView = doneToolbar

    }
    // acao do botão(converter)
    @objc func doneButtonAction()
    {
        self.textField.resignFirstResponder()
    }
    
    // esconde o teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.endEditing(true)
    }
    
    
    func setupCellsCollectionView(){
        
        // Clears list of selected tags:
        listViewLikesSelecionados.removeAll()
        
        for i in 0..<8 {
            listViewLikesSelecionados.append(false)
        }
        
        dataSource.data.removeAll()
        
        let listTitulosReceita = ["DHBank", "DHBank", "DHBank", "DHBank", "DHBank", "DHBank", "DHBank", "DHBank"]
        let listImagensReceita = ["DhBank", "DhBank", "DhBank", "DhBank", "DhBank", "DhBank", "DhBank", "DhBank"]
        
        for i in 0..<8 {
            let selectedRecipeModel = SelectedRecipeCollectionViewModel(delegate: self, tituloReceita: listTitulosReceita[i], imagemReceita: listImagensReceita[i], viewSelecionada: listViewLikesSelecionados[i], indexView: i).self
            dataSource.data.append(selectedRecipeModel)
        }
        
        dataSource.initializeCollectionView(collectionView: collectionViewReceitas)
    
    }

}



