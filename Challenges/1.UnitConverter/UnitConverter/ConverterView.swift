import SwiftUI

struct ConverterView: View {
    
    @Binding var theme: Theme
    var selectedInputUnit: [Dimension]
    
    @State private var inputUnit: Dimension
    @State private var outputUnit: Dimension
    @State private var inputValue: Double = 0
    @State private var outputValue: Double = 0
    
    var body: some View {
            VStack {
                HStack {
                    Text("Input Unit")
                        .frame(width: 80)
                    Spacer()
                    Picker("", selection: $inputUnit) {
                        ForEach(selectedInputUnit, id: \.self) {
                            Text("\($0.symbol)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: inputUnit) {
                        calculateBackward()
                    }
                }
                HStack {
                    Text("Output Unit")
                        .frame(width: 80)
                    Spacer()
                    Picker("", selection: $outputUnit) {
                        ForEach(selectedInputUnit, id: \.self) {
                            Text("\($0.symbol)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: outputUnit) {
                        calculateForward()
                    }
                }
                Divider()
                HStack {
                    TextField("Input Size", value: $inputValue, format: .number)
                        .onChange(of: inputValue) {
                            calculateForward()
                        }
                    TextField("Output Size", value: $outputValue, format: .number)
                        .onChange(of: outputValue) {
                            calculateBackward()
                        }
                }
            }
            .onChange(of: selectedInputUnit) {
                refresh()
            }
    }
    
    init(theme: Binding<Theme>) {
        self._theme = theme
        selectedInputUnit = getOptions(theme.wrappedValue)
        _inputUnit = State(initialValue: getOptions(theme.wrappedValue)[0])
        _outputUnit = State(initialValue: getOptions(theme.wrappedValue)[0])
    }
    
    func refresh() {
        inputUnit = getOptions(theme)[0]
        outputUnit = getOptions(theme)[0]
    }
    
    func calculateForward() {
        let input = Measurement(value: inputValue, unit: inputUnit)
        let result = input.converted(to: outputUnit)
        outputValue = result.value
    }
    
    func calculateBackward() {
        let output = Measurement(value: outputValue, unit: outputUnit)
        let result = output.converted(to: inputUnit)
        inputValue = result.value
    }
}

#Preview {
    ConverterView(theme: .constant(Theme.temperature))
}
