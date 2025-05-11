import SwiftUI

struct ContentView: View {
    @State private var display = "0"
    @State private var currentNumber: Double = 0
    @State private var previousNumber: Double = 0
    @State private var currentOperation: String = ""
    @State private var isTypingNumber = false

    let buttons = [
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "−"],
        ["0", ".", "=", "+"]
    ]

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text(display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()

            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            self.buttonTapped(button)
                        }) {
                            Text(button)
                                .font(.title)
                                .frame(width: 70, height: 70)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(Circle())
                        }
                    }
                }
            }

            Button("C") {
                self.clear()
            }
            .font(.title2)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }

    func buttonTapped(_ button: String) {
        if let number = Double(button) {
            if isTypingNumber {
                display += button
            } else {
                display = button
                isTypingNumber = true
            }
        } else if button == "." {
            if !display.contains(".") {
                display += "."
                isTypingNumber = true
            }
        } else if button == "=" {
            currentNumber = Double(display) ?? 0
            calculateResult()
            isTypingNumber = false
        } else {
            previousNumber = Double(display) ?? 0
            currentOperation = button
            isTypingNumber = false
        }
    }

    func calculateResult() {
        var result: Double = 0
        switch currentOperation {
        case "+":
            result = previousNumber + currentNumber
        case "−":
            result = previousNumber - currentNumber
        case "×":
            result = previousNumber * currentNumber
        case "÷":
            result = currentNumber != 0 ? previousNumber / currentNumber : 0
        default:
            break
        }
        display = String(result)
    }

    func clear() {
        display = "0"
        currentNumber = 0
        previousNumber = 0
        currentOperation = ""
        isTypingNumber = false
    }
}

#Preview {
    ContentView()
}