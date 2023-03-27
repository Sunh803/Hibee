//
//  CardImage.swift
//  Hibee
//
//  Created by 김예림 on 2023/03/28.
//

import SwiftUI

struct CardImage: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    @Binding var isToggled: Bool
    @Binding var offset: CGSize
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 0.93, green: 0.95, blue: 0.96))
                .frame(width: width, height: height)
                .shadow(color: Color(red: 0.29, green: 0.36, blue: 0.43).opacity(0.15), radius: 5, x: 0, y: 0)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 10)
                .frame(width: width-10, height: height-10)
            
            
            VStack {
                Image(systemName: "suit.club.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.red)
            }
            
        }.rotation3DEffect(Angle(degrees: -degree), axis: (x: 0, y: 0, z: -1))
            .offset(offset)
            .onTapGesture {
                withAnimation(.spring()) {
                    isToggled.toggle()
                    offset = isToggled ? CGSize(width: offset.width, height: offset.height - 30) : CGSize(width: offset.width, height: offset.height + 30)
                }
            }
    }
}


struct CardImage_Previews: PreviewProvider {
    static var previews: some View {
        CardImage(width: 200, height: 300, degree: .constant(0), isToggled: .constant(false), offset: .constant(.zero))
    }
}
