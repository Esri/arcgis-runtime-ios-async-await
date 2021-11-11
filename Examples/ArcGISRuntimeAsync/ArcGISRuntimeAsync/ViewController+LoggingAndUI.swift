// Copyright 2021 Esri.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit
import ArcGIS

// MARK: UI manipulation
extension ViewController {
    internal func setupUI() {
        calculatingView.layer.borderColor = UIColor.lightGray.cgColor
        calculatingView.layer.borderWidth = 2
        calculatingView.layer.cornerCurve = .circular
        calculatingView.layer.cornerRadius = 10
        
        logTextView.layer.borderColor = UIColor.lightGray.cgColor
        logTextView.layer.borderWidth = 1
        
        clearLog()
    }
    
    @MainActor
    internal func showCalculatingView(message: String, withProgress: Bool = false) async {
        calculateRouteButton.isEnabled = false
        cancelCalculationButton.isEnabled = true
        calculatingView.isHidden = false
        calculatingLabel.text = message
        activityIndicator.startAnimating()
        progressView.isHidden = !withProgress
        if withProgress {
            progressView.progress = 0
        }
        
        logSection(message)
    }
    
    @MainActor
    internal func hideCalculatingView() async {
        calculateRouteButton.isEnabled = true
        activityIndicator.stopAnimating()
        cancelCalculationButton.isEnabled = false
        
        // Pause for 2.5 seconds before hiding the view.
        try? await Task.sleep(nanoseconds: 2_500_000_000)

        calculatingView.isHidden = true
        progressView.isHidden = true
        progressView.progress = 0
        progressView.isHidden = true
    }
}


// MARK: Logging
extension ViewController {
    func clearLog() {
        Task {
            await MainActor.run {
                logTextView.text = ""
            }
        }
    }
    
    func logMessage(_ message: String) {
        Task {
            await MainActor.run {
                let currentText = logTextView.text ?? ""
                logTextView.text = "\(currentText)\(currentText.isEmpty ? "" : "\n")\(message)"
                
                let end = NSMakeRange(logTextView.text.count - 1, 1)
                logTextView.scrollRangeToVisible(end)
                
                print(message)
            }
        }
    }
    
    func logSection(_ sectionName: String) {
        logMessage("\n#### \(sectionName.uppercased()) ####")
    }
}

// MARK: Alerts
extension ViewController {

    func showError(title: String, error: Error) {
        showAlert(title: title, message: error.localizedDescription)
        print(error)
    }
    
    func showError(_ error: Error) {
        showError(title: "Error", error: error)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        Task {
            await MainActor.run {
                present(alert, animated: true, completion: nil)
            }
        }
        
        logMessage("Alert (\(title)): \(message)")
    }
}
