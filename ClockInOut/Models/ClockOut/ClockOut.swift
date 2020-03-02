//
//  ClockOut.swift
//  ClockInOut
//
//  Created by ven2aj on 22/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation
struct ClockOut: Codable {
    let timesheet: ClockIn?

    enum CodingKeys: String, CodingKey {
        case timesheet = "timesheet"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        timesheet = try values.decodeIfPresent(ClockIn.self, forKey: .timesheet)
    }

}
