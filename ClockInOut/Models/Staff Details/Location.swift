//
//  Location.swift
//  ClockInOut
//
//  Created by ven2aj on 22/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation
struct Location: Codable {
    let address: Address?

    enum CodingKeys: String, CodingKey {
        case address = "address"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address = try values.decodeIfPresent(Address.self, forKey: .address)
    }

}
