//
//  FittingStack.swift
//  WorkoutDemo
//
//  Created by Jaydeep Joshi on 18/12/24.
//

import SwiftUI

struct FittingStack<Content: View>: View {
    private let alignment: Alignment
    private let spacing: CGFloat?
    private let content: (Axis) -> Content

    init(alignment: Alignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping (Axis) -> Content) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        ViewThatFits {
            HStack(alignment: alignment.vertical, spacing: spacing) {
                content(.horizontal)
            }
            VStack(alignment: alignment.horizontal, spacing: spacing) {
                content(.vertical)
            }
        }
    }
}

#Preview("Normal font size") {
    FittingStack { _ in
        Text("ABC")
        Text("DEF")
        Text("GHI")
        Text("JKL")
        Text("MNO")
    }
}

#Preview("A11y font size") {
    FittingStack { _ in
        Text("ABC")
        Text("DEF")
        Text("GHI")
        Text("JKL")
        Text("MNO")
    }.dynamicTypeSize(.accessibility5)
}
