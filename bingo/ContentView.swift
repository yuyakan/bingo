//
//  ContentView.swift
//  bingo
//
//  Created by 上別縄祐也 on 2022/03/16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var bingo = ViewController()
    @State var draw = [0]
    @State var flag = false
    @State var first = true
    @State var open = false
    @State var reset = false
    var body: some View {
        let bound = UIScreen.main.bounds
        let height = bound.height
        NavigationView{
            VStack{
                HStack{
                    Button(action: {
                        flag = false
                        first = true
                        open = false
                        reset = false
                        draw = bingo.reset()
                    }, label: {
                        Text("Reset")
                            .foregroundColor(Color.red)
                            .font(.title)
                            .padding(.leading)
                            .opacity(reset ? 1:0)
                            .disabled(reset)
                    })
                    Spacer()
                    NavigationLink(destination: ListView(draw: $draw)) {
                            Text("List")
                                .font(.title)
                                .foregroundColor(Color.mint)
                                .padding(.trailing)
                    }
                }
                ZStack{
                    Image("bingo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: height * 0.35)
                }
                if draw[0] == 0 {
                    HStack{}
                    Button(action: {
                    }, label: {
                        Text(" ")
                            .font(.title)
                            .foregroundColor(Color.mint)})
                    Button(action: {
                        open = true
                        draw = bingo.start()
                    }, label: {
                        Image("start")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: height * 0.35)
                            .shadow(radius: 5)
                    })
                }else{
                    Image("\(draw.last!)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: height * 0.35)
                        .shadow(radius: 5)
                        .scaleEffect(flag ? 1 : 0)
                        .rotationEffect(flag ? .degrees(0 + 360) : .degrees(0))
                        .animation(.easeOut, value: flag)
                }
                if first {
                    HStack{
                        if open {
                            Spacer()
                            Button(action: {
                                flag = true
                                first = false
                                open = false
                            }, label: {
                                Text("Open")
                                    .font(.title)
                                    .foregroundColor(Color.mint)})
                            Spacer()
                        }
                    }
                }else if draw[0] == -1{
                    HStack{
                        Spacer()
                        Button(action: {
                            flag = false
                            first = true
                            open = false
                            reset = false
                            draw = bingo.reset()
                        }, label: {
                            Text("Reset")
                                .font(.title)
                                .foregroundColor(Color.mint)
                        })
                        Spacer()
                    }
                }else{
                    HStack{
                        if open {
                            Spacer()
                            Button(action: {
                                draw = bingo.start()
                                flag = true
                                open = false
                                reset = false
                            }, label: {
                                Text("Open")
                                    .font(.title)
                                    .foregroundColor(Color.mint)})
                            Spacer()
                        }else{
                            Spacer()
                            Button(action: {
                                flag = false
                                open = true
                                reset = true
                            }, label: {
                                Text("Next")
                                    .font(.title)
                                    .foregroundColor(Color.mint)})
                            Spacer()
                        }
                    }
                }
            }.navigationBarHidden(true)
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
