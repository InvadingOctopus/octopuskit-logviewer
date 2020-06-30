//
//  OKLogViewerButton.swift
//  OctopusKitLogViewer https://github.com/InvadingOctopus/octopuskit-logviewer
//  OctopusKit          https://github.com/InvadingOctopus/octopuskit
//  OctopusUI           https://github.com/InvadingOctopus/octopusui
//
//  Created by ShinryakuTako@invadingoctopus.io on 2020-05-21
//  Copyright © 2020 Invading Octopus. Licensed under Apache License v2.0 (see LICENSE.txt)
//

import OctopusKit
import OctopusUI
import SwiftUI

/// A button that displays a viewer for `OctopusKit.unifiedLog`.
public struct OKLogViewerButton: View {
    
    @State var showingLogs: Bool = false
    
    private let logs = [
        OctopusKit.unifiedLog,
        OctopusKit.logForFramework,
        OctopusKit.logForComponents,
        OctopusKit.logForWarnings,
        OctopusKit.logForErrors,
        OctopusKit.logForDebug
    ]
    
    public init() {}
    
    public var body: some View {
        Button(action: { self.showingLogs.toggle() } ) {
            Image(systemName: "scroll.fill")
                .resizable()
                .accessibility(label: Text("View OctopusKit Log"))
        }
        .sheet(isPresented: $showingLogs) {
            OKLogBinder(logs: self.logs, showingLogs: self.$showingLogs)
        }
    }
}

struct LogViewerButton_Previews: PreviewProvider {
    static var previews: some View {
       OKLogViewerButton()
    }
}
