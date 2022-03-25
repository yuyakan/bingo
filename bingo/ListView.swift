//
//  SwiftUIView.swift
//  bingo
//
//  Created by 上別縄祐也 on 2022/03/16.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var bingo = ViewController()
    @Binding var draw:[Int]
    var body: some View {
        VStack{
            Spacer()
            ForEach(0..<(draw.count / 5), id:\.self){num1 in
                HStack{
                    ForEach(0..<5, id:\.self){num2 in
                        Text("\(draw[num1 * 5 + num2])")
                            .font(.largeTitle)
                            .padding(.horizontal)
                    }
                }
            }
            HStack{
                ForEach(0..<(draw.count % 5), id:\.self){num2 in
                    Text("\(draw[(draw.count / 5) * 5 +  num2])")
                        .font(.largeTitle)
                        .padding(.horizontal)
                }
            }.padding(.bottom)
            Spacer()
            Text("　")
            Spacer()
        }
    }
}
