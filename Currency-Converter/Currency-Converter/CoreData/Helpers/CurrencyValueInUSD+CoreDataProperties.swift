//
//  CurrencyValueInUSD+CoreDataProperties.swift
//  
//
//  Created by Anumol Abraham Chakkungal on 04/09/2022.
//
//

import Foundation
import CoreData


extension CurrencyValueInUSD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CurrencyValueInUSD> {
        return NSFetchRequest<CurrencyValueInUSD>(entityName: "CurrencyValueInUSD")
    }

    @NSManaged public var id: String?
    @NSManaged public var rate: Double
    @NSManaged public var upDated: Date?

}
