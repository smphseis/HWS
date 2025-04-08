//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Phil Seißelberg on 21.04.24.
//

import SwiftUI

struct ListLayoutView: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        HStack(spacing: 20) {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                            
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.title)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.title3)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .listStyle(.plain)
            .navigationTitle("Moonshot")
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    return ListLayoutView(astronauts: astronauts, missions: missions)
}
