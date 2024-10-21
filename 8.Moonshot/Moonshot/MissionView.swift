//
//  MissionView.swift
//  Moonshot
//
//  Created by Phil Seißelberg on 21.04.24.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    
    struct CrewMember { //führt Astronat und Mission zusammen
        let role: String
        let astronaut: Astronaut
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding()

                Text(mission.formattedLaunchDate)
                    .font(.system(size: 30))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    CustomDivider()
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)

                    Text(mission.description)
                    
                    CustomDivider()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                CrewView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(.dark) //muss hier nochmal seperat gennat werden, weil Aufruf nicht über Stack der ContentView
}
