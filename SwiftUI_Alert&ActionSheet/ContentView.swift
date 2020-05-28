//
//  ContentView.swift
//  SwiftUI_Alert&ActionSheet
//
//  Created by Paymint on 2020/05/28.
//  Copyright © 2020 Paymint. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showingAlert = false
    @State var showingActionSheet = false
    @State var showingSheet = false
    
    var body: some View {
        
        VStack(spacing: 20){
            
            Button(action:{self.showingAlert = true}){
                Text("Alert")
            }.alert(isPresented: $showingAlert){
                Alert(
                    title: Text("제목"),
                    message: Text("내용"),
                    primaryButton: .default(Text("확인"), action: {print("확인")}),
                    secondaryButton: .cancel(Text("취소"))
                )
            }
            
            Button(action: {self.showingActionSheet = true}){
                Text("ActionSheet")
            }
            .actionSheet(isPresented: $showingActionSheet){
                ActionSheet(
                    title: Text("제목"),
                    message: Text(""),
                    buttons: [
                        .default(Text("버튼1")),
                        .default(Text("버튼1")),
                        .default(Text("버튼1")),
                        .destructive(Text("닫기")),
                        .cancel(Text("취소")),
                    ]
                )
            }
            
            Button(action: {self.showingSheet.toggle() }) {
                Text("Present")
                    .font(.title).foregroundColor(.blue)
            }
            .sheet(isPresented: $showingSheet,
                   onDismiss: {print("Dismissed")},
                   content: {PresentedView() })
        }
    }
}

struct PresentedView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            if self.presentationMode.wrappedValue.isPresented{
                self.presentationMode.wrappedValue.dismiss()
                  print("닫음")
            }
        }) {
            Text("Tap to Dismiss")
                .font(.title).foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
