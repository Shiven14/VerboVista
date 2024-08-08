import SwiftUI

struct ContentView: View {
    @State private var showLanguageOptions = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("logo1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .ignoresSafeArea()
                
                Spacer()
                
                Text("Welcome to VerboVista")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Spacer()
                
                NavigationLink(destination: ModulesListView()) {
                    Text("Start Learning English")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom)
                }
                
                Spacer()
            }
            .background(Color.black)
            .navigationBarTitle("VerboVista ")
        }
    }
}
