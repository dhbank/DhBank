//
//  TelaPrincipalViewController.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit
import FirebaseAuth


class TelaPrincipalViewController: UIViewController, SelectedRecipeCollectionViewModelCallBack {
    
    @IBOutlet weak var LogoutButton: UIBarButtonItem!
    @IBOutlet weak var valueUser: UITextField!
    @IBOutlet weak var brlButton: UIButton!
    @IBOutlet weak var collectionViewReceitas: UICollectionView!
    @IBOutlet weak var textField : UITextField!
    @IBOutlet weak var shareButton: UIButton!
    
    let viewModel: HomeViewModel = .init()
    
    var listViewLikesSelecionados = [Bool]()
    var listStringFilteredTags = [String]()
    
    static var valueUSD: String = ""
    var valueUSDBID: String = ""
    
    static var valueEUR: String = ""
    var valueEURBID: String = ""
    
    let dataSource = SelectedFilterRecipesDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        
        let defaults = UserDefaults.standard
        defaults.set("1", forKey: "valorUser")
        updateLabel()
        getitem()
        self.addDoneButtonOnKeyboard()
        carregaImagemShareButton()
    }
    
    
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
    
    
    func getitem(){
        let services: apiServices = .init()
        
        services.getAllDataUSD { CoinModel in
            let valorEmDOLAR = (CoinModel!.usdbrl.bid as NSString).doubleValue
            let transformeString = String(format: "%.2f", ceil(valorEmDOLAR*100)/100)
            TelaPrincipalViewController.valueUSD = transformeString
            self.valueUSDBID = CoinModel!.usdbrl.bid
            self.setupCellsCollectionView()
        }
        
        services.getAllDataEUR { CoinModelEUR in
            let valorEmEURO = (CoinModelEUR!.eurbrl.bid as NSString).doubleValue
            let transformeString = String(format: "%.2f", ceil(valorEmEURO*100)/100)
            TelaPrincipalViewController.valueEUR = transformeString
            self.valueEURBID = CoinModelEUR!.eurbrl.bid
            self.setupCellsCollectionView()
        }
        
    }
    
    
    @IBAction func LogoutButton(_ sender: Any) {
       deslogarFirebase()
    }
    
    func deslogarFirebase(){
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "loginsegueidentifier", sender: nil)
        }catch{
            print(">>> Erro ao fazer logout")
        }
    }
    
    
    func updateLabel(){
        let valorEmEURO = ((UserDefaults.standard.object(forKey: "valorUser")) as! NSString).doubleValue
        let transformeString = String(format: "%.2f", ceil(valorEmEURO*100)/100)
        valueUser.text = transformeString
    }
    
    
    
    func converteEUR(){
        let valueOne = (valueEURBID as NSString).doubleValue
        let valororitg = (UserDefaults.standard.object(forKey: "valorUser"))
        let valueTwo = (valororitg as! NSString).doubleValue
        let valueInDol =  valueOne * valueTwo
        let transform2huse = String(format: "%.2f", ceil(valueInDol*100)/100)
        TelaPrincipalViewController.valueEUR = transform2huse
        setupCellsCollectionView()
    }
    
    func converteUSD(){
        let valueOne = (valueUSDBID as NSString).doubleValue
        let valororitg = (UserDefaults.standard.object(forKey: "valorUser"))
        let valueTwo = (valororitg as! NSString).doubleValue
        let valueInDol =  valueOne * valueTwo
        let transform2huse = String(format: "%.2f", ceil(valueInDol*100)/100)
        TelaPrincipalViewController.valueUSD = transform2huse
        setupCellsCollectionView()
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
    @objc func doneButtonAction(){
        let defaults = UserDefaults.standard
        defaults.set(self.valueUser.text, forKey: "valorUser")
        self.valueUser.resignFirstResponder()
        converteEUR()
        converteUSD()
    }
    
    // esconde o teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.endEditing(true)
    }
    
    
    func setupCellsCollectionView(){
        listViewLikesSelecionados.removeAll()
        for _ in 0..<8 {
            listViewLikesSelecionados.append(false)
        }
        dataSource.data.removeAll()
        let listTitulosReceita = ["USD", "EUR"]
        let listImagensReceita = [TelaPrincipalViewController.valueUSD, TelaPrincipalViewController.valueEUR ]
        
        for i in 0..<2 {
            let selectedRecipeModel = SelectedRecipeCollectionViewModel(delegate: self, tituloReceita: listTitulosReceita[i], imagemReceita: listImagensReceita[i], viewSelecionada: listViewLikesSelecionados[i], indexView: i).self
            dataSource.data.append(selectedRecipeModel)
        }
        
        dataSource.initializeCollectionView(collectionView: collectionViewReceitas)
        collectionViewReceitas.contentInset = UIEdgeInsets(top: 35, left: 0, bottom: 10, right: 0)
        
        self.collectionViewReceitas.reloadData()
    
    }

}

extension TelaPrincipalViewController: HomeViewModelDelegate {
    func logoutEfetuado() {
        performSegue(withIdentifier: "loginsegueidentifier", sender: nil)
    }
    
}

extension TelaPrincipalViewController: CoinViewModelDelegate{
    
    
    func getAllData() {
        print("teste")
    }
    
    
}

