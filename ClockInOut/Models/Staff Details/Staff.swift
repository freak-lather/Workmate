//
//  Staff.swift
//  ClockInOut
//
//  Created by ven2aj on 22/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation
struct Staff: Codable {
    let id: String?
    let wage_amount: String?
    let wage_type: String?
    let client: Client?
    let location: Location?
    let position: Position?
    let manager: Manager?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case wage_amount = "wage_amount"
        case wage_type = "wage_type"
        case client = "client"
        case location = "location"
        case position = "position"
        case manager = "manager"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        wage_amount = try values.decodeIfPresent(String.self, forKey: .wage_amount)
        wage_type = try values.decodeIfPresent(String.self, forKey: .wage_type)
        client = try values.decodeIfPresent(Client.self, forKey: .client)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        position = try values.decodeIfPresent(Position.self, forKey: .position)
        manager = try values.decodeIfPresent(Manager.self, forKey: .manager)
    }
}
