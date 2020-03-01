//
//  ContentView.swift
//  WorkflowPlayground
//
//  Created by Ben Cochran on 2/29/20.
//  Copyright © 2020 Ben Cochran. All rights reserved.
//

import One
import SwiftUI
import Two
import Workflow
import WorkflowSwiftUI
import WorkflowUI

enum Content: String, Hashable, CaseIterable, Identifiable {
    case one = "One"
    case two = "Two"

    var id: Content { self }

    var name: String { rawValue }

    var view: some View {
        switch self {
        case .one: return WrappingWorkflow(OneRootWorkflow())
        case .two: return WrappingWorkflow(TwoRootWorkflow())
        }
    }
}

struct ContentView: View {

    @State var detail: Content?

    var body: some View {
        List(Content.allCases) { content in
            Button(action: { self.detail = content }) {
                Text(content.name)
            }
        }
        .sheet(item: $detail) { content in
            content.view
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
