//
//  UpdateStore.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/5/17.
//

import SwiftUI

import Combine

class UpdateStore: ObservableObject {
    @Published var updates = updateData
}
