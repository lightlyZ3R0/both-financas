//
//  ContentView.swift
//  aulaGemini
//
//  Created by Turma02-14 on 04/09/26.
//

import SwiftUI
import FirebaseAI

struct ContentView: View {
    
    let model = FirebaseAI.firebaseAI(backend: .googleAI()).generativeModel(modelName: "gemini-3.1-flash-lite")
    
    @State var prompt: String = ""
    @State var respostaIA: String = ""
    @State var taCarregando: Bool = false
    
    func enviaMensagem() {
        let promptUsuario = prompt
        prompt = ""
        taCarregando = true
        respostaIA = ""
        
        Task {
            do {
                let resposta = try await model.generateContent(promptUsuario)
                respostaIA = resposta.text ?? "Eu não sei..."
            } catch {
                respostaIA = "Erro: \(error.localizedDescription)"
            }
            taCarregando = false
        }
    }
    
    var body: some View {
        VStack {
            TextField("Digite sua dúvida", text: $prompt)
                .
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
