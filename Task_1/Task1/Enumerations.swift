//
//  Enumerations.swift
//  Task1
//
//  Created by Никита Гусев on 27.02.2021.
//

import Foundation

enum Decade: String {
    init(decadeNumber: Int){
        switch decadeNumber {
        case 1:
            self = .first
        case 2:
            self = .second
        case 3:
            self = .third
        default:
            self = .first
        }
    }
    case first = "Первая декада "
    case second = "Вторая декада "
    case third = "Третья декада "
}

enum Month: String {
    init(monthNumber: Int){
        switch monthNumber{
        case 1:
            self = .january
        case 2:
            self = .february
        case 3:
            self = .march
        case 4:
            self = .april
        case 5:
            self = .may
        case 6:
            self = .june
        case 7:
            self = .july
        case 8:
            self = .august
        case 9:
            self = .september
        case 10:
            self = .october
        case 11:
            self = .november
        case 12:
            self = .december
        default:
            self = .january
        }
    }
    case january = "января"
    case february = "февраля"
    case march = "марта"
    case april = "апреля"
    case may = "мая"
    case june = "июня"
    case july = "июля"
    case august = "августа"
    case september = "сентября"
    case october = "октября"
    case november = "ноября"
    case december = "декабря"
}
