//
//  UpdateDetail.swift
//  SwiftUiBaseStudy
//
//  Created by Alan Zhang on 2025/5/10.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[0]
    var body: some View {
        ScrollView {
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            Text(update.text)
        }
        .navigationTitle(update.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UpdateDetail()
}
