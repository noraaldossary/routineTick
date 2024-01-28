//
//  newtask.swift
//  routineTick
//
//  Created by amal on 16/07/1445 AH.
//

import Foundation
import SwiftData
@Model
class NewTask {
    var titleName: String
    var descr: String
    var todaytime : Date
    var todaystart : Date
    var todayend : Date
    
    init(titleName: String = "", descr: String = "", todaytime: Date = Date(), todaystart: Date = Date() , todayend: Date = Date())
    {
        self.titleName = titleName
        self.descr = descr
        self.todaytime = todaytime
        self.todaystart = todaystart
        self.todayend = todayend
    }
    
    
}

