//
//  ContentView.swift
//  New Calculator
//
//  Created by Miguel Ferrer Fornali on 12/10/2020.
//

import SwiftUI
import AVFoundation
import GoogleMobileAds

struct ContentView: View {
    
    @State private var modalWindow = false
    @State private var firstNumber = 0.0
    @State private var secondNumber = 0.0
    @State private var operand = ""
    @State private var calculatorText = "0"
    @State private var detailedCalculatorText = ""
    @State private var isTypingNumber = false
    @State private var operands = ["+","-","×","÷"]
    @State private var limitOfDigits = 16
    @State private var limitOfDetailedDigits = 24
    @State private var buttonPressedSystemSoundID:SystemSoundID = 1104
    @State private var deletePressedSystemSoundID:SystemSoundID = 1155
    
    var body: some View {
        VStack {
            VStack {
                AdView().frame(width: UIScreen.main.bounds.size.width, height: 50, alignment: .center)
                HStack {
                    Button(action: {
                        self.modalWindow.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .font(.title)
                    }.sheet(isPresented: self.$modalWindow, content: {
                        ModalWindow()
                    })
                    Spacer()
                }.padding(.leading, 5.0).padding(.top, 1.0)
            }
            Spacer()
            VStack {
                VStack {
                    TextField("0", text: $calculatorText)
                        .multilineTextAlignment(.trailing)
                        .font(.custom("", size: 80.0))
                        .disabled(true)
                        .minimumScaleFactor(0.5)
                        .padding(.trailing, 10.0)
                    
                    TextField("", text: $detailedCalculatorText)
                        .multilineTextAlignment(.trailing)
                        .font(.custom("", size: 50.0))
                        .disabled(true)
                        .padding(.trailing, 10.0)
                        .minimumScaleFactor(0.4)
                        .foregroundColor(.gray)
                }
                VStack {
                    HStack {
                        Spacer()

                        Button(action: {
                            self.Ctapped()
                        }) {
                            Text("C")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color(UIColor(named: "OperandsColor")!)) //Using named color
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.copyTapped()
                        }) {
                            Text("✎")
                                .font(.custom("", size: 35.0))
                                .foregroundColor(.blue)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color(UIColor(named: "OperandsColor")!)) //Using named color
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.deleteTapped()
                        }) {
                            Text("⌫")
                                .font(.title)
                                .foregroundColor(.blue)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color(UIColor(named: "OperandsColor")!)) //Using named color
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.operandTapped("÷")
                        }) {
                            Text("÷")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color(UIColor(named: "OperandsColor")!)) //Using named color
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped("7")
                        }) {
                            Text("7")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped("8")
                        }) {
                            Text("8")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped("9")
                        }) {
                            Text("9")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.operandTapped("×")
                        }) {
                            Text("×")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color(UIColor(named: "OperandsColor")!)) //Using named color
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped("4")
                        }) {
                            Text("4")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped("5")
                        }) {
                            Text("5")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped("6")
                        }) {
                            Text("6")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.operandTapped("-")
                        }) {
                            Text("﹣")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color(UIColor(named: "OperandsColor")!)) //Using named color
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped("1")
                        }) {
                            Text("1")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped("2")
                        }) {
                            Text("2")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped("3")
                        }) {
                            Text("3")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.operandTapped("+")
                        }) {
                            Text("＋")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color(UIColor(named: "OperandsColor")!)) //Using named color
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped(",")
                        }) {
                            Text(",")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.digitTapped("0")
                        }) {
                            Text("0")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color.blue)
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.calculate()
                        }) {
                            Text("＝")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .frame(width: 115, height: 30, alignment: .center)
                                .padding(.all, 20.0)
                                .background(Color(UIColor(named: "OperandsColor")!)) //Using named color
                                .cornerRadius(50.0)
                        }
                        
                        Spacer()
                    }
                }
            }
        }.padding(.bottom)
        .background(Color(UIColor(named: "BackgroundColor")!)) //Using named color
    }

    private func digitTapped(_ number: String) {
        AudioServicesPlaySystemSound(buttonPressedSystemSoundID) //Play a specific sound
        if detailedCalculatorText.count >= limitOfDetailedDigits || calculatorText.count >= limitOfDigits {
            //Do nothing
        } else if isTypingNumber && calculatorText.contains(",") && (number == ",") {
            //Do nothing. A number can't contain two ','
        } else if !isTypingNumber && (calculatorText == "0") && (number == "0") {
            //Do nothing
        } else if isTypingNumber && (calculatorText == "0") && (number == "0") {
            //Do nothing
        } else if isTypingNumber && (calculatorText == "0") && (number == ",") {
            calculatorText += number
            detailedCalculatorText += number
        } else if isTypingNumber && (calculatorText == "0") {
            calculatorText = String(calculatorText.dropLast())
            detailedCalculatorText = String(detailedCalculatorText.dropLast())
            calculatorText += number
            detailedCalculatorText += number
        } else if (calculatorText == "0") && (number == ",") {
            calculatorText += number
            detailedCalculatorText = "0\(number)"
            isTypingNumber = true
        } else if operands.contains(calculatorText) && (number == ",") {
            //Do nothing
        } else if !isTypingNumber {
            calculatorText = number
            detailedCalculatorText += number
            isTypingNumber = true
        } else if isTypingNumber {
            calculatorText += number
            detailedCalculatorText += number
            addSeparators()
        }
    }
    
    private func operandTapped(_ operand: String) {
        AudioServicesPlaySystemSound(buttonPressedSystemSoundID) //Play a specific sound
        if detailedCalculatorText.count >= limitOfDetailedDigits || calculatorText.count >= limitOfDigits {
            //Do nothing
        } else if operands.contains(String(calculatorText.last!)) {
            calculatorText = String(calculatorText.dropLast()) //Deleting the operand
            detailedCalculatorText = String(detailedCalculatorText.dropLast()) //Deleting the operand
            calculatorText = operand
            detailedCalculatorText += operand
        } else if calculatorText == "0" && detailedCalculatorText.isEmpty {
            firstNumber = Double(calculatorText)!
            calculatorText = operand
            detailedCalculatorText += "0"
            detailedCalculatorText += operand
        } else if calculatorText.last == "," {
            calculatorText = String(calculatorText.dropLast())
            firstNumber = Double(calculatorText)!
            calculatorText = operand
            detailedCalculatorText = String(detailedCalculatorText.dropLast())
            detailedCalculatorText += operand
        } else if (calculatorText != "0") && detailedCalculatorText.isEmpty {
            firstNumber = Double(calculatorText)!
            detailedCalculatorText = "\(calculatorText)\(operand)"
            calculatorText = operand
        } else {
            calculatorText = calculatorText.replacingOccurrences(of: ".", with: "")
            calculatorText = calculatorText.replacingOccurrences(of: ",", with: ".")
            firstNumber = Double(calculatorText)!
            calculatorText = operand
            detailedCalculatorText += operand
        }
        isTypingNumber = false
        self.operand = operand
    }
    
    private func Ctapped() {
        AudioServicesPlaySystemSound(buttonPressedSystemSoundID) //Play a specific sound
        firstNumber = 0.0
        secondNumber = 0.0
        operand = ""
        calculatorText = "0"
        detailedCalculatorText = ""
        isTypingNumber = false
    }
    
    private func copyTapped() {
        UIPasteboard.general.string = calculatorText //Write to clipboard
        AudioServicesPlaySystemSound(buttonPressedSystemSoundID) //Play a specific sound
    }
    
    private func deleteTapped() {
        AudioServicesPlaySystemSound(deletePressedSystemSoundID) //Play a specific sound
        if operands.contains(calculatorText) {
            detailedCalculatorText = String(detailedCalculatorText.dropLast())
            calculatorText = detailedCalculatorText
            isTypingNumber = true
        } else if (calculatorText.count >= 2) && (detailedCalculatorText == "") {
            calculatorText = String(calculatorText.dropLast())
        } else if (calculatorText.count >= 2) {
            calculatorText = String(calculatorText.dropLast())
            detailedCalculatorText = String(detailedCalculatorText.dropLast())
            addSeparators()
        } else if (calculatorText.count < 2) && (detailedCalculatorText.count < 2) {
            calculatorText = "0"
            detailedCalculatorText = ""
            isTypingNumber = false
        } else if (calculatorText.count < 2) && (detailedCalculatorText.count >= 2) {
            let start = detailedCalculatorText.index(detailedCalculatorText.endIndex, offsetBy: -calculatorText.count-1)
            let end = detailedCalculatorText.index(start, offsetBy: 1)
            let range = start..<end
            let n = detailedCalculatorText[range]
            calculatorText = String(n)
            detailedCalculatorText = String(detailedCalculatorText.dropLast())
        }
    }

    private func calculate() {
        AudioServicesPlaySystemSound(buttonPressedSystemSoundID) //Play a specific sound
        if operands.contains(calculatorText) {
            //Do nothing
        } else if (firstNumber == 0.0) && (secondNumber == 0.0) && (operand == "") && (calculatorText == "0") {
            detailedCalculatorText = ""
        } else {
            isTypingNumber = false
            var result  = 0.0
            
            detailedCalculatorText = detailedCalculatorText.replacingOccurrences(of: "÷", with: "/")
            detailedCalculatorText = detailedCalculatorText.replacingOccurrences(of: "×", with: "*")
            detailedCalculatorText = detailedCalculatorText.replacingOccurrences(of: ",", with: ".")
            
            if isMultiCalculationEnabled() {
                firstNumber = getMultiCalculationResult()
                secondNumber = Double(calculatorText)!
            }
            
            if isAutoCalculationEnabled() { //Checking if calculator is in AutoCalculation mode or not
                let tempCalculatorText = calculatorText.replacingOccurrences(of: ".", with: "")
                let tempCalculatorText2 = tempCalculatorText.replacingOccurrences(of: ",", with: ".")
                firstNumber = Double(tempCalculatorText2)!
            } else {
                let tempCalculatorText = calculatorText.replacingOccurrences(of: ".", with: "")
                let tempCalculatorText2 = tempCalculatorText.replacingOccurrences(of: ",", with: ".")
                secondNumber = Double(tempCalculatorText2)!
            }
            
            if operand == "+" {
                result = firstNumber + secondNumber
            } else if operand == "-" {
                result = firstNumber - secondNumber
            } else if operand == "×" {
                result = firstNumber * secondNumber
            } else if operand == "÷" {
                result = firstNumber / secondNumber
            }

            arrangingCalculatedResult(result)
            detailedCalculatorText = ""

            print("AutoCalculation = \(isAutoCalculationEnabled())")
            print("MultiCalculation = \(isMultiCalculationEnabled())")
            print("Operando = \(operand)")
            print("First number = \(firstNumber)")
            print("Second number = \(secondNumber)")
            print("Result number = \(result), calculatorText = \(calculatorText)")
        }
    }
    
    private func isAutoCalculationEnabled() -> Bool {
        var autoCalculation = true
        
        if detailedCalculatorText.contains("+") || detailedCalculatorText.contains("-") || detailedCalculatorText.contains("*") || detailedCalculatorText.contains("/") {
            autoCalculation = false
        }
        
        return autoCalculation
    }
    
    private func arrangingCalculatedResult(_ result: Double) {
        calculatorText = String(result)
        calculatorText = calculatorText.replacingOccurrences(of: ".", with: ",")
        let last2chars = String(calculatorText.suffix(2))
        
        if last2chars == ",0" { //Deleting ",0" of the results that has not decimals
            calculatorText = String(calculatorText.dropLast())
            calculatorText = String(calculatorText.dropLast())
        }
        addSeparators()
    }
    
    private func isMultiCalculationEnabled() -> Bool {
        var multiCalculationEnabled = false
        
        let numberOfPlusOccurrences = detailedCalculatorText.filter { $0 == "+" }.count
        let numberOfMinusOccurrences = detailedCalculatorText.filter { $0 == "-" }.count
        let numberOfMultOccurrences = detailedCalculatorText.filter { $0 == "x" }.count
        let numberOfDivOccurrences = detailedCalculatorText.filter { $0 == "/" }.count
        let numberOfOperandsOccurrences = numberOfPlusOccurrences + numberOfMinusOccurrences + numberOfMultOccurrences + numberOfDivOccurrences
        
        if numberOfOperandsOccurrences >= 2 {
            multiCalculationEnabled = true
        }
        
        return multiCalculationEnabled
    }
    
    private func getMultiCalculationResult() -> Double {
        var multiCalculationResult = 0.0
        
        let numberOfCharsToDeleteFromEnd = calculatorText.count + 1
        let firstNumberExpression = detailedCalculatorText.prefix(detailedCalculatorText.count - numberOfCharsToDeleteFromEnd)
        let solution = NSExpression(format: String(firstNumberExpression)) //Solving a math operation inside a String
        multiCalculationResult = solution.expressionValue(with: nil, context: nil) as! Double
        
        return multiCalculationResult
    }
    
    private func addSeparators() {
        var calculatorTextWithoutDecimals = ""
        var numberOfDigits = 0
        
        calculatorText = calculatorText.replacingOccurrences(of: ".", with: "")
        if let indexOfComma = calculatorText.range(of: ",")?.lowerBound {
            let substring = calculatorText[..<indexOfComma]
            calculatorTextWithoutDecimals = String(substring)
            numberOfDigits = calculatorTextWithoutDecimals.count
        } else {
            numberOfDigits = calculatorText.count
        }
        
        switch numberOfDigits {
            case 4:
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 1))
            case 5:
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 2))
            case 6:
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 3))
            case 7:
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 1))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 5))
            case 8:
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 2))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 6))
            case 9:
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 3))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 7))
            case 10:
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 1))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 5))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 9))
            case 11:
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 2))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 6))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 10))
            case 12:
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 3))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 7))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 11))
            case 13:
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 1))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 5))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 9))
                calculatorText.insert(".", at: calculatorText.index(calculatorText.startIndex, offsetBy: 13))
            default:
                calculatorText = calculatorText + ""
        }
        
        //Getting the index when appears the last operand in "detailedCalculatorText"
        var pos = 0
        var i = 0
        for char in detailedCalculatorText.reversed() {
            if operands.contains(String(char)) {
                pos = i
                break
            } else { i+=1 }
        }
        if pos != 0 {
            for _ in 1...pos {
                detailedCalculatorText = String(detailedCalculatorText.dropLast())
            }
            detailedCalculatorText += calculatorText
        } else {
            detailedCalculatorText = calculatorText
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AdView : UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        banner.adUnitID = "ca-app-pub-4840465078074416/3540647423"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }
    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}

/* COSAS QUE HACER: (con Licencia de Desarrollador)

1). OPCIÓN VENTANA MODAL = Compra única para quitar anuncios
2). OPCIÓN VENTANA MODAL = Compra de un Pack que incluye: Posibilidad cambiar a icono oscuro, Cambiar forma de los botones y Cambiar los colores de la app entre varios temas disponibles
3). OPCIÓN VENTANA MODAL = Promoción del desarrollador (rrss, mail, etc)
*/
