//
//  AddEventViewModel.swift
//  EventsJournal
//
//  Created by waheedCodes on 06/09/2021.
//

import Foundation
import FirebaseAnalytics

final class AddEventViewModel {
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
    }
    
    // MARK: - PROPERTIES
    
    var title = "Add Event"
    var onUpdate: () -> Void = {}
    private(set) var cells: [Cell] = []
    weak var coordinator: AddEventCoordinator?
    
    private var nameCellViewModel: TitleSubtitleCellViewModel?
    private var dateCellViewModel: TitleSubtitleCellViewModel?
    private var backgroundCellViewModel: TitleSubtitleCellViewModel?
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyy"
        return formatter
    }()
    
    private let cellBuilder: EventCellBuilder
    private let eventService: EventServiceProtocol
    
    // MARK: - INITIALIZERS
    
    init(cellBuilder: EventCellBuilder,
         eventService: EventServiceProtocol = EventService()
    ) {
        self.cellBuilder = cellBuilder
        self.eventService = eventService
    }
    
    // MARK: - METHODS
    
    func viewDidLoad() {
        setUpCells()
        onUpdate()
//        print("On Add Event Page")
        var jeggings: [String: Any] = [
          AnalyticsParameterItemID: "SKU_123",
          AnalyticsParameterItemName: "jeggings",
          AnalyticsParameterItemCategory: "pants",
          AnalyticsParameterItemVariant: "black",
          AnalyticsParameterItemBrand: "Google",
          AnalyticsParameterPrice: 9.99,
        ]
        var purchaseParams: [String: Any] = [
          AnalyticsParameterTransactionID: "T12345",
          AnalyticsParameterAffiliation: "Google Store",
          AnalyticsParameterCurrency: "USD",
          AnalyticsParameterValue: 14.98,
          AnalyticsParameterTax: 2.58,
          AnalyticsParameterShipping: 5.34,
          AnalyticsParameterCoupon: "SUMMER_FUN"
        ]

        // Add items
        purchaseParams[AnalyticsParameterItems] = [jeggings]

        // Log purchase event
        Analytics.logEvent(AnalyticsEventPurchase, parameters: purchaseParams)
//        // Specify order quantity
//        jeggings[AnalyticsParameterQuantity] = 2
//
//        // Prepare order parameters
//        var orderParameters: [String: Any] = [
//          AnalyticsParameterCurrency: "USD",
//          AnalyticsParameterValue: 44.97
//        ]
    }
    
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    func tappedDone() {
        
        // Extract info from the cell view model
        guard
            let name = nameCellViewModel?.subtitle,
            let dateString = dateCellViewModel?.subtitle,
            let date = dateFormatter.date(from: dateString),
            let image = backgroundCellViewModel?.image
        else { return }
        
        // Save in core data
        eventService.perform(.add,
                             EventInputData(name: name,
                                            date: date,
                                            image: image))
        
        // Tell coordinator to dismiss the add event view controller
        coordinator?.didFinishSaveEvent()
    }
    
    func updateCell(atIndexPath: IndexPath, subtitle: String) {
        
        switch cells[atIndexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
        }
    }
    
    func tappedSelectImageRow(at indexPath: IndexPath) {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            guard titleSubtitleCellViewModel.type == .image else {
                return
            }
            
            coordinator?.showImagePicker { image in
                // do something with image...
                titleSubtitleCellViewModel.update(image)
            }
        }
    }
}

private extension AddEventViewModel {
    func setUpCells() {
        nameCellViewModel = cellBuilder.makeTitleSubtitleViewModel(.text)
        dateCellViewModel = cellBuilder.makeTitleSubtitleViewModel(.date) { [weak self] in
            self?.onUpdate()
        }
        backgroundCellViewModel = cellBuilder.makeTitleSubtitleViewModel(.image) { [weak self] in
            self?.onUpdate()
        }
        guard
            let nameCellViewModel = nameCellViewModel,
            let dateCellViewModel = dateCellViewModel,
            let backgroundCellViewModel = backgroundCellViewModel else { return }
        
        cells = [
            .titleSubtitle(
                nameCellViewModel
            ),
            .titleSubtitle(
                dateCellViewModel
            ),
            .titleSubtitle(
                backgroundCellViewModel
            )
        ]
    }
}
