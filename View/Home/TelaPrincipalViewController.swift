//
//  TelaPrincipalViewController.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit


class TelaPrincipalViewController: UIViewController, SelectedRecipeCollectionViewModelCallBack {
    
    @IBOutlet weak var valueUser: UITextField!
    
  
    @IBOutlet weak var usdButton: UIButton!
    
    @IBOutlet weak var brlButton: UIButton!
    @IBOutlet weak var eurButton: UIButton!
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
    
    let viewModel: CoinViewModel = .init()
        
    var listViewLikesSelecionados = [Bool]()
    var listStringFilteredTags = [String]()

    
    @IBOutlet weak var collectionViewReceitas: UICollectionView!
    @IBOutlet weak var textField : UITextField!
    @IBOutlet weak var shareButton: UIButton!
    
    var valueUSD: String = ""
    var valueEUR: String = ""
    var valueBRL: String = UserDefaults.standard.object(forKey: "valorUser") as! String
    
    let dataSource = SelectedFilterRecipesDataSource()
    
    func getitem(){
        let services: apiServices = .init()
        
        services.getAllDataUSD { CoinModel in
            self.valueUSD = CoinModel!.usdbrl.bid
            self.setupCellsCollectionView()
        }
        services.getAllDataEUR { CoinModelEUR in
            self.valueEUR = CoinModelEUR!.eurbrl.bid
            self.setupCellsCollectionView()
        }
        
    }
    
    
    override func loadView() {
        super.loadView()
        valueUser.text = UserDefaults.standard.object(forKey: "valorUser") as! String
        
        getitem()
       
        self.addDoneButtonOnKeyboard()
        carregaImagemShareButton()
    }
    
    func updateLabel(){
        valueUser.text = UserDefaults.standard.object(forKey: "valorUser") as! String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        defaults.set("100,00", forKey: "valorUser")
        
        
        updateLabel()
        
        getitem()
       
        self.addDoneButtonOnKeyboard()
        carregaImagemShareButton()
        
       
    }
    
    @IBAction func brlButton(_ sender: Any) {
        updateLabel()
    }
    
    @IBAction func eurButton(_ sender: Any) {
        
        
        let valueOne = (valueEUR as NSString).doubleValue
        var valororitg = (UserDefaults.standard.object(forKey: "valorUser"))
        var valueTwo = (valororitg as! NSString).doubleValue
        
        
        var valueInDol =  valueOne * valueTwo
        
       var string = String(valueInDol)

        let defaults = UserDefaults.standard
        defaults.set(string, forKey: "valorUser")
        updateLabel()
    }
    
    
    @IBAction func usdButton(_ sender: Any) {
        
        let valueOne = (valueUSD as NSString).doubleValue
        var valororitg = (UserDefaults.standard.object(forKey: "valorUser"))
        var valueTwo = (valororitg as! NSString).doubleValue
        
        
        var valueInDol =  valueOne * valueTwo
        
       var string = String(valueInDol)

        let defaults = UserDefaults.standard
        defaults.set(string, forKey: "valorUser")
        updateLabel()
    }
    
    
    func carregaImagemShareButton() {
        shareButton.setImage(image, for: .normal)
    }
    
    // Implement code wherein you take snapshot of the screen if needed. For illustration purposes, assumed an image stored as asset.
    let image: UIImage = UIImage(systemName: "square.and.arrow.up") ?? UIImage()
        

    // Button Action. Create a button in your application for "Share" action. Link it to your Controller and add these 3 lines.
    @IBAction func shareButton(_ shareButton: UIButton) {
        
        shareButton.setImage(image, for: .normal)
        let VC = UIActivityViewController(activityItems: ["DHBank"], applicationActivities: nil)
        VC.popoverPresentationController?.sourceView = self.view
        self.present(VC, animated: true, completion: nil)
      
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
        
        let listTitulosReceita = ["USD", "EUR","BRL"]
        let listImagensReceita = [self.valueUSD, self.valueEUR, self.valueBRL ]
        
        for i in 0..<3 {
            let selectedRecipeModel = SelectedRecipeCollectionViewModel(delegate: self, tituloReceita: listTitulosReceita[i], imagemReceita: listImagensReceita[i], viewSelecionada: listViewLikesSelecionados[i], indexView: i).self
            dataSource.data.append(selectedRecipeModel)
        }
        
        dataSource.initializeCollectionView(collectionView: collectionViewReceitas)
        collectionViewReceitas.contentInset = UIEdgeInsets(top: 35, left: 0, bottom: 10, right: 0)
    
    }

}

extension TelaPrincipalViewController: CoinViewModelDelegate{
    
    
    func getAllData() {
        print("teste")
    }
    
    
}

