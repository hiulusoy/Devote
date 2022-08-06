//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Halil Usanmaz on 6.08.2022.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack{
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 32,weight: .semibold,design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    feedback.notificationOccurred(.success)
                    if configuration.isOn {
                        playSound(sound: "sound-rise", type: "mp3")
                    }
                    else {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
            configuration.label
        }//:HSTACK
    }
}

struct CheckboxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Placeholder Label",isOn: .constant(true))
            .toggleStyle(CheckboxStyle())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
