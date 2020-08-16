//
//  RepositoriesListViewModel.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/15/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import Foundation
import PromiseKit

class RepositoriesListViewModel: ViewModelable {
    
    // MARK: Data & Delegates
    
    internal var dataSource : GenericDataSource<Repository>
    private var viewModelDelegate : ViewModelDelegate
    
    // MARK: Initializer
    
    init(viewDataSource : GenericDataSource<Repository> = RepositoryDataSource(),
         delegate : ViewModelDelegate ) {
        self.viewModelDelegate = delegate
        self.dataSource = viewDataSource
    }
}

extension RepositoriesListViewModel : NetworkManagerInjector {
    
    // fetch all Repository
    func fetchData(){
        if mustShowIndicator() {
            viewModelDelegate.didStartFetchingData?()
        }
        networkManager.getData(request: RepositoryRouter.getLast30Days()).done {
            ( repositories : [Repository] ) in
            self.dataSource.data.value = repositories
            self.viewModelDelegate.didFinishFetchingData?()
        }.catch { (error) in
            print("Fetching failed! ", error)
        }.finally {
            
        }
    }

}
