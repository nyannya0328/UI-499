//
//  Home.swift
//  UI-499
//
//  Created by nyannyan0328 on 2022/03/10.
//

import SwiftUI
import Lottie


struct Home: View {
    @State var expandCard : Bool = false
    
    @State var bottomLiquidView : AnimationView = AnimationView(name: "LiquidWave", bundle: .main)
    @State var topLiquidView : AnimationView = AnimationView(name: "LiquidWave", bundle: .main)
    
    
    @State var isFinish : Bool = false
    var body: some View {
        VStack{
            
            
            VStack{
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                .overlay {
                    
                    Text("Rember For me")
                        .font(.title.weight(.semibold))
                        .foregroundColor(.gray)
                }
                
               Rectangle()
                    .fill(.black)
                    .frame(height: 1)
                    .padding(.top,20)
                    .shadow(color: .red, radius: 5, x: 5, y: 5)
                    .blur(radius: 1)
                   
            }
            

            LiquidCard(title: "MLB", subTitle: "Jacob Degrom", detail: "MLB start Pitcher", description: "He averages 100MPH throws and overpowes hittes.In college,he was a shortstop,same as Rivera", onExpand: {
                
                
                if isFinish{return}
                isFinish = true
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + (expandCard ? 0 : 0.2)) {
                    
                    
                    bottomLiquidView.play(fromProgress: expandCard ? 0 : 0.45, toProgress: expandCard ? 0.6 : 0)
                    
                    topLiquidView.play(fromProgress: expandCard ? 0 : 0.45, toProgress: expandCard ? 0.6 : 0){staus in
                        
                        
                        isFinish = false
                    }
                    
                  
                    
                    
                    
                    
                }
                
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1)){
                    
                    
                    
                    
                    expandCard.toggle()
                }
            
                
                
                
            })
            .frame(maxHeight:.infinity)
            
            
            
            

            
        }
        .padding()
        .frame(maxHeight:.infinity,alignment: .top)
    }
    
    @ViewBuilder
    func LiquidCard(title : String,subTitle : String,detail : String,description : String,color : SwiftUI.Color = Color("Blue"),onExpand : @escaping()->())->some View{
        
        
        ZStack{
            
            
            
            VStack(spacing:20){
                
                Text(title)
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                HStack(spacing:20){
                    
                    Image(systemName: "speaker.wave.3")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    
                    Text(subTitle)
                        .font(.title3.weight(.semibold))
                        .foregroundColor(.white)
                    
                    
                }
                
                
            }
            .padding()
            .frame(maxWidth:.infinity)
            .frame(height:expandCard ? 280 : 350)
            .background{
                
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    let scale = size.width / 1000
                    
                    
                    
                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(color)
                    
                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(color)
                        .mask {
                            
                            ResizableLootieView(lottieView: $topLiquidView)
                                .scaleEffect(x: scale, y: scale, anchor: .leading)
                        }
                        .rotationEffect(.init(degrees: 180))
                        .offset(y: expandCard ? size.height / 1.43 : 0)
                        
                    
                    
                }
                
                
            }
            .overlay(alignment: .bottom) {
                
                Button {
                    
                    onExpand()
                    
                } label: {
                    
                    
                    Image(systemName: "chevron.down")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(30)
                        .background(
                        
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.white)
                                
                        )
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
                    
                }
                .padding(.bottom,-20)

                
            }
            .zIndex(1)
            
            
            VStack(spacing:20){
                
                
                Text(detail)
                    .font(.largeTitle.weight(.bold))
                
                
                Text(description)
                    .font(.title3)
                    .lineLimit(3)
                
                
                
                
                
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth:.infinity)
            .background{
                
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    let scale = size.width / 1000
                    
                    
                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(color)
                    
                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(color)
                        .mask {
                            
                            ResizableLootieView(lottieView: $bottomLiquidView)
                                .scaleEffect(x: scale, y: scale, anchor: .leading)
                        }
                       
                        .offset(y: expandCard ? -size.height / 1.2 : -size.height / 1.4)
                    
                    
                }
                
                
            }
            .zIndex(0)
            .offset(y: expandCard ? 280 : 10)
            
            
            
            
            
           
        }
        .offset(y: expandCard ? -120 : 0)
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
