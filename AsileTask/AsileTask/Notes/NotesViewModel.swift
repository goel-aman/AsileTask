//
//  NotesViewModel.swift
//  AsileTask
//
//  Created by aman on 09/11/24.
//


class NotesViewModel {
    let networkManager = NetworkManager()
    
    func getData() {
        Task {
            let data: NotesModel = try await networkManager.request(url: APIEndpoints.notes)
            
            print(data)
            // update the notes view with latest data....
        }
    }
    
}
