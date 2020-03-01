//
//  OneView.swift
//  One
//
//  Created by Ben Cochran on 2/29/20.
//

import SwiftUI

public struct OneView: View {
    var text: String

    public var body: some View {
        Text(text)
    }
}

struct OneView_Previews: PreviewProvider {
    static var previews: some View {
        OneView(text: "Hello")
    }
}
