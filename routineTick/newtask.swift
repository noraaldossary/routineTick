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
    var title: String
    var descr: String
    var todaytime : Data
    var todaystart : Data
    var todayend : Data
    init(title: String = "", descr: String = "", todaytime: Data = Data(), todaystart: Data = Data(), todayend: Data = Data()) {
        self.title = title
        self.descr = descr
        self.todaytime = todaytime
        self.todaystart = todaystart
        self.todayend = todayend
    }
    
    
}

