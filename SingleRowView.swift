//
//  SingleRowView.swift
//  DesignDemoApp
//
//  Created by Ozan Kocakaya on 31.08.23.
//

import SwiftUI

struct SingleRowView: View {
    var pet: PetModel
    var body: some View {
        
        HStack {
            Image(pet.imageName)
                .resizable()
                .frame(width: 96, height: 96)
                .mask(Capsule(style: .continuous))
            VStack(alignment: .leading) {
                Text(pet.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(pet.type)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct SingleRowView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRowView(pet: PetModel.cat1)
    }
}
