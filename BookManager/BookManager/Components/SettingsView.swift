//
//  SettingsView.swift
//  BookManager
//
//  Created by mbair on 11/10/25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(SETTINGS_THEME_KEY) private var currentTheme: Theme = DEFAULT_SETTINGS_THEME
    @AppStorage(FAVORITE_GRID_COLUMN_NUMBER_KEY) private var numberOfColumns: Int = DEFAULT_FAV_GRID_COLUMNS_NUMBER
    
    
//    @State var currentTheme: Theme = .light
    
    var body: some View {
        
        NavigationView
        {
            Form
            {
                Section(header: Text("Appearance"))
                {
                    Picker("Theme", selection: $currentTheme){
                        ForEach(Theme.allCases, id:\.self){ theme in
                            Text(theme.rawValue).tag(theme)
                        } // foreach end
                    } // picker end
                } // Section end
                Section(header: Text("Display Settings"))
                {
                    Stepper("Fav section columns: \(numberOfColumns)", value: $numberOfColumns, in 1...4)
                }// end second section
            } // form end
        } // nav view end
    }
}

