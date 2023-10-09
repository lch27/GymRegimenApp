//
//  ContentView.swift
//  GymRegimen
//
//  Created by Maggie Li on 2023/10/09.


import SwiftUI

struct Exercise: Hashable {
    var dayOfWeek: String?
    var name: String
    var muscleGroups: [String]
    var reps: Int
    var sets: Int
    var totalReps: Int
    
    init(dayOfWeek: String, name: String, muscleGroups: [String], reps: Int, sets: Int) {
        self.dayOfWeek = dayOfWeek
        self.name = name
        self.muscleGroups = muscleGroups
        self.reps = reps
        self.sets = sets
        self.totalReps = sets * reps
    }
}

struct Regimen {
    var dayOfWeek: String?
    var exercises: [Exercise]

    init(dayOfWeek: String, exercises: [Exercise]) {
        self.dayOfWeek = dayOfWeek
        self.exercises = exercises
    }
}

struct ContentView: View {
    var mondayRegimen = Regimen(dayOfWeek: "Monday", exercises: [Exercise(dayOfWeek: "Monday", name: "Push up", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 10, sets: 3)])
    
    var tuesdayRegimen = Regimen(dayOfWeek: "Tuesday", exercises: [Exercise(dayOfWeek: "Tuesday", name: "Yoga", muscleGroups: ["Whole Body"], reps: 0, sets: 1)])
  
    var WedsnesdayRegimen = Regimen(dayOfWeek: "Wednesday", exercises: [Exercise(dayOfWeek: "Wedsneday", name: "Jogging", muscleGroups: ["cardiovascular fitness"], reps: 1, sets: 3)])
    
    var ThursdayRegimen = Regimen(dayOfWeek: "Thursday", exercises: [Exercise(dayOfWeek: "Thursday", name: "Squat", muscleGroups: ["Thighs"], reps:10, sets: 5)])
  
    var combinedExercises: [Exercise] {
        return mondayRegimen.exercises + tuesdayRegimen.exercises + WedsnesdayRegimen.exercises + ThursdayRegimen.exercises
    }
        
    var body: some View {
        
        VStack {
            
            // Monday's Exercise Plan
            HStack {
                Spacer()
                Text("Weekly Exercise Plan")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer() // Add a spacer on the right to push the title to the center
            }
        }
        
        
        List {
            ForEach(combinedExercises, id: \.self) { exercise in
                VStack(alignment: .leading, spacing: 10) {
                    Text(exercise.dayOfWeek ?? "")  // Display the day of the week
                        .font(.headline)
                    
                    Text("Exercise: \(exercise.name)")
                    Text("Muscle Groups: \(exercise.muscleGroups.joined(separator: ", "))")
                    Text("Sets: \(exercise.sets)")
                    Text("Reps: \(exercise.reps)")
                    Text("Total Reps: \(exercise.totalReps)")
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)  // Apply a plain list style
        .padding(.trailing, 30)
    }
}
