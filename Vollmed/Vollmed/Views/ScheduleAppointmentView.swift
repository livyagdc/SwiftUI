//
//  ScheduleAppointmentView.swift
//  Vollmed
//
//  Created by lgc on 17/10/24.
//

import SwiftUI

struct ScheduleAppointmentView: View {
    
    @State private var selectedDate = Date()
    var body: some View {
        VStack {
            Text("Selecione a data e o horário da consulta")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            DatePicker("Escolha a data da consulta", selection: $selectedDate)
                .datePickerStyle(.graphical)
            
            Button{
                print("Botão pressionado")
            } label: {
                ButtonView(text: "Agendar consulta")
            }
        }
        .padding()
        .navigationTitle("Agendar consulta")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    ScheduleAppointmentView()
}
