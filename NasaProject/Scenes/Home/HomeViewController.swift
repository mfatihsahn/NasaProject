//
//  Home.swift
//  NasaProject
//
//  Created by FATIH on 23.02.2021.
//

import UIKit

protocol filterProtocol {
    func filter(params: String?)
}
class HomeViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: PhotoCollectionView!
    @IBOutlet weak var backgroundGif: UIImageView!
    var noDataPage :NoDataPageView!
    var viewModel : HomeViewModel!
    
    var page :Int = 1
    var stopLoading : Bool = false
    var camType : String?
    var roverType : String = ""
    var selectedIndex  :Int?
    var turnBackFilter : Bool = false
    var photoModel : [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundGif.loadGif(name: "spaceGif")
        selectedIndex = self.tabBarController?.selectedIndex
        //Select Page Type
        switch selectedIndex {
        case 0:
            roverType = "spirit"
        case 1:
            roverType = "opportunity"
        default:
            roverType = "curiosity"
            break
        }
        viewModel.getPhotoList(camType: camType, page: page, roverType : roverType)
        setupCollectionView()
        addNodata()
    }
    
    func setupCollectionView() {
        collectionView.register(PhotoViewCell.self)
        collectionView.click = click
        collectionView.load = load
        self.registerLoadableViewModel(viewModel: viewModel)
    }
    
    override func refreshViews() {
        
        if viewModel.responsePhotoModel.count > 0{
            stopLoading = false
            noDataPage.isHidden = true
            photoModel.append(contentsOf: viewModel.responsePhotoModel)
            collectionView.items = photoModel
            collectionView.reloadData()
        }
        else {
            stopLoading = true
            //If the desired result is not available when returning from the filter for No data view display  and on the first page
            if  turnBackFilter && page == 1 {
                turnBackFilter = false
                photoModel = []
                collectionView.items = photoModel
                noDataPage.isHidden = false
                noDataPage.labelNodata.text = "No Data"
                collectionView.reloadData()
            }
        }
    }
    
    override func getError(error : Error) {
        noDataPage.isHidden = false
        noDataPage.labelNodata.text = error.localizedDescription
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    //If we want the data to be refreshed in each tab, the requests will be made here.
    }
    @IBAction func filterAction(_ sender: Any) {
        let vc = RouterStoryBoard.Filter.initialViewController(type: FilterViewController.self)
        switch selectedIndex {
        case 0:
            vc.filterType = .SpiritFilter
        case 1:
            vc.filterType = .OppurtunityFilter
        default:
            vc.filterType = .CuriosityFilter
            break
        }
        vc.camKey = camType ?? nil
        vc.delegate = self
        Router.shared.push(vc, from: self)
    }
    
    //CollectionView Didselect func
    func click(_ row : Int)
    {
        let vc = DetailPopUp()
        vc.modalPresentationStyle = .fullScreen
        vc.photoList =  self.photoModel[row]
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Pagination
    func load() {
        page += 1
        print("page: " + String(page))
        if !stopLoading //!isLoading &&
        {
            viewModel.getPhotoList(camType: camType, page: page, roverType: roverType)
        }
    }
    
    // MARK: - NoDataPage
    func addNodata()  {
        noDataPage = NoDataPageView(frame: CGRect(x: 16, y: 0, width: self.view.frame.width - 32, height: self.view.frame.height))
        noDataPage.isHidden = true
        self.view.addSubview(noDataPage)
    }
}

extension   HomeViewController : filterProtocol {    
    func filter(params: String?) {
        camType = params
        photoModel = []
        page = 1
        turnBackFilter = true
        viewModel.getPhotoList(camType: camType, page: page, roverType: roverType)
    }
}
